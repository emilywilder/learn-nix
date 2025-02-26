let
    unspecified =
        let
            x = 1;
            y = 2;
        in
        {
            inherit x y;
        };
    specified =
        let
          a = { x = 1; y = 2; };
        in
        {
          inherit (a) x y;
        };
    in_let =
        let
            inherit ({ x = 1; y = 2; }) x y;
        in
            [ x y];
in
    [
        unspecified
        specified
        in_let
    ]