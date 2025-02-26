let
    interpolation =
        let
            name = "Nix";
        in
        "hello ${name}";
    multiline =
        ''
        multi
            line
        string
        '';
in
    {
        inherit interpolation multiline;
    }