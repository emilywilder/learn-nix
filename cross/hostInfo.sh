#!/bin/bash

echo "Host platform (guess): " $(
  $(nix-build '<nixpkgs>' -I nixpkgs=channel:nixos-23.11 -A gnu-config)/config.guess
)
echo Host platform config: $(nix-instantiate --eval --strict getPkgsCrossHostPlatformConfig.nix)