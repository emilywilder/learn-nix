let
  ex_toString = {
    a = 1;
    __toString = self: "a: " + toString self.a;
  };
  gt = x: y: y > x;
  list_1_5 = [ 1 2 3 4 5];
in
builtins.trace ''


ex_toString = { a = 1; __toString = self: ...; };
gt = x: y: y > x;
list_1_5 = [ 1 2 3 4 5];
''
{
  "builtins.toString ex_toString" = builtins.toString ex_toString;
  "builtins.add 1 2" = builtins.add 1 2;
  "builtins.all (gt 3) list_1_5" = builtins.all (gt 3) list_1_5;
  "builtins.any (gt 3) list_1_5" = builtins.any (gt 3) list_1_5;
}
