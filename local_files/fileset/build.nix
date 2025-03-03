{ stdenv, lib }:
let
  fs = lib.fileset;
  # needed fs.intersection since this is a subdirectory in an existing git repo
  sourceFiles = fs.intersection
    (fs.gitTracked ../..)
    (fs.unions [
        ./hello.txt
        ./world.txt
        ./build.sh
        ./src
    ])
  ;
in

fs.trace sourceFiles

stdenv.mkDerivation {
  name = "fileset";
  src = fs.toSource {
    root = ./.;
    fileset = sourceFiles;
  };
  postInstall = ''
    cp -vr . $out
  '';
}