# script copied from documentation
mkdir fileset
cd fileset
nix-shell -p npins --run "npins init --bare; npins add github nixos nixpkgs --branch nixos-23.11"