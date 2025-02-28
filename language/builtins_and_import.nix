let
    pkgs = import <nixpkgs> {};
    oneplustwo = import ./1plus2.nix;
in
pkgs.lib.strings.toUpper "one plus two equals " + builtins.toString oneplustwo