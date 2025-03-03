let
    nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/release-23.11";
    pkgs = import nixpkgs {};
in
pkgs.pkgsCross.aarch64-darwin.stdenv.hostPlatform.config