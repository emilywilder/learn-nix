let
  f = x : x + 1;
  g = x: y: x + y;
in
builtins.trace ''

Definitions:
  f = x : x + 1
  g = x: y: x + y

Applications:''
{
  "f 1" = f 1;
  "g 1 2" = g 1 2;
}