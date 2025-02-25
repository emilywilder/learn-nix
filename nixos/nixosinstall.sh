#!/bin/bash

DISK=/dev/vda
#DISK=/dev/nvme0n1

# partition
parted ${DISK} -- mklabel gpt
parted ${DISK} -- mkpart root ext4 512MB -8GB
parted ${DISK} -- mkpart swap linux-swap -8GB 100%
parted ${DISK} -- mkpart ESP fat32 1MB 512MB
parted ${DISK} -- set 3 esp on

# format
mkfs.ext4 -L nixos ${DISK}1
mkswap -L swap ${DISK}2
swapon ${DISK}2
mkfs.fat -F 32 -n boot ${DISK}3
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount -o umask=077 /dev/disk/by-label/boot /mnt/boot

# install
nixos-generate-config --root /mnt
nano /mnt/etc/nixos/configuration.nix
nixos-install
nixos-enter --root /mnt -c 'passwd emily'
reboot
