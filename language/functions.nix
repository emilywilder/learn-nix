let
  f = x : x + 1;
  f' = x: x.a;
  f'v = { a = 1; };
  g = x: y: x + y;
  h = { a, b }: a + b;
  j = { a, b ? 2 }: a + b;
  k = { a, b, ... }: a + b;
  m = args@{ a, b, ... }: a + b + args.c;
in
builtins.trace ''

Definitions:
  f'v = { a = 1; };

Single argument functions:
  f = x : x + 1
  f' = x: x.a
  g = x: y: x + y
Attribute set argument:
  h = { a, b }: a + b
  j = { a, b ? 2 }: a + b
  k = { a, b, ... }: a + b
Named attribute set argument:
  m = args@{ a, b, ... }: a + b + args.c

Applications:''
{
  "f 1" = f 1;
  "f' { a = 1; }" = f' { a = 1; };
  "f' f'v" = f' f'v;
  "g 1 2" = g 1 2;
  "h { a = 1; b = 2; }" = h { a = 1; b = 2; };
  "j { a = 1; }" = j { a = 1; };
  "k { a = 1; b = 2; c = 3; }" = k { a = 1; b = 2; c = 3; };
  "m { a = 1; b = 2; c = 3; }" = m { a = 1; b = 2; c = 3; };
}