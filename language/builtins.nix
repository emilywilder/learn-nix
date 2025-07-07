let
  ex_toString = {
    a = 1;
    __toString = self: "a: " + toString self.a;
  };
in
builtins.trace ''

ex_toString = { a = 1; __toString = self: ...; }
''
{
  "builtins.toString ex_toString" = builtins.toString ex_toString;
  "builtins.add 1 2" = builtins.add 1 2;
}
