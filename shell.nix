let
    # We use a version of Nixpkgs pinned to a release branch.
    nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
    # We explicitly set config and overlays to avoid them being inadvertently overridden by global configuration.
    pkgs = import nixpkgs {
        config = {};
        overlays = [];
    };
in

# mkShellNoCC is a function that takes as argument an attribute set.
# Here we give it an attribute packages with a list containing two items from the pkgs attribute set.
# mkShellNoCC is a wrapper around mkDerivation
pkgs.mkShellNoCC {
    packages = with pkgs; [
        cowsay
        lolcat
    ];
    GREETING = "Hello, Lix!";
    shellHook = ''
        echo $GREETING | cowsay | lolcat
    '';
}
