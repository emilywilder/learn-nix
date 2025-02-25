#!/bin/bash

DISK='/dev/nvme0n1'
MNT=$(mktemp -d)
SWAPSIZE=2
RESERVE=1

partition_disk () {
 local disk="${1}"
 blkdiscard -f "${disk}" || true

 parted --script --align=optimal  "${disk}" -- \
 mklabel gpt \
 mkpart EFI 1MiB 1GiB \
 mkpart rpool 1GiB -$((SWAPSIZE + RESERVE))GiB \
 mkpart swap  -$((SWAPSIZE + RESERVE))GiB -"${RESERVE}"GiB \
 set 1 esp on \

 partprobe "${disk}"
}

for i in ${DISK}; do
   partition_disk "${i}"
done

zpool create \
    -o ashift=12 \
    -o autotrim=on \
    -R "${MNT}" \
    -O acltype=posixacl \
    -O canmount=off \
    -O dnodesize=auto \
    -O normalization=formD \
    -O relatime=on \
    -O xattr=sa \
    -O mountpoint=none \
    rpool \
   $(for i in ${DISK}; do
      printf '%s ' "${i}p2";
     done)

zfs create -o canmount=noauto -o mountpoint=legacy rpool/root
zfs create -o mountpoint=legacy rpool/home
mount -o X-mount.mkdir -t zfs rpool/root "${MNT}"
mount -o X-mount.mkdir -t zfs rpool/home "${MNT}"/home

for i in ${DISK}; do
 mkfs.vfat -n EFI "${i}"p1
done

for i in ${DISK}; do
 mount -t vfat -o fmask=0077,dmask=0077,iocharset=iso8859-1,X-mount.mkdir "${i}"p1 "${MNT}"/boot
 break
done

nixos-generate-config --root "${MNT}"
NETWORKD_ID=$(head -c 8 /etc/machine-id)
nano "${MNT}"/etc/nixos/hardware-configuration.nix

nixos-install  --root "${MNT}"

cd /
umount -Rl "${MNT}"
zpool export -a

reboot