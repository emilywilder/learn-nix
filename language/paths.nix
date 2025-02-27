let
    absolute = /absolute/path;
    relative = relative/path;
    parent = ../.;
    nixpkgs = <nixpkgs>;
    nixpkgs_lib = <nixpkgs/lib>;
in
{
    inherit absolute relative parent nixpkgs nixpkgs_lib;
}