let
  pkgs = import <nixpkgs> { };
in
rec {
  a = pkgs.callPackage ./a.nix { };
  b = pkgs.callPackage ./b.nix { inherit a; };
  c = pkgs.callPackage ./c.nix { inherit b; };
  d = pkgs.callPackage ./d.nix { };
  e = pkgs.callPackage ./e.nix { inherit c d; };
}