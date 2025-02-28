let
    currentpath = "${./.}";
    oneplustwopath = "${./1plus2.nix}";
    gitrepo = builtins.fetchGit ./..;
in
{
    "The nix store path to ./" = currentpath;
    "The nix store path to ./1plus2.nix" = oneplustwopath;
    "The git repo of this project" = gitrepo;
}