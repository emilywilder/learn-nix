let
  lib = import <nixpkgs/lib>;
  ex_toString = {
    a = 1;
    __toString = self: "a: " + toString self.a;
  };
  gt = x: y: y > x;
in
builtins.trace ''


ex_toString = { a = 1; __toString = self: ...; };
gt = x: y: y > x;
''
{
  "builtins.toString ex_toString" = builtins.toString ex_toString;
  "builtins.add 1 2" = builtins.add 1 2;
  "builtins.all (gt 3) (lib.range 1 5)" = builtins.all (gt 3) (lib.range 1 5);
  "builtins.any (gt 3) (lib.range 1 5)" = builtins.any (gt 3) (lib.range 1 5);
}