let
   f = x : x + 1;
   g = x: x.a;

   v = { a = 1; };

   h = x: y: x + y;
in
{
    "v" = v;
    "f 2" = (f 2);
    "g { a = 1; }" = (g { a = 1; });
    "f v" = (g v);
    "(x: x + 1) 1" = (x: x + 1) 1;
    "[ g v ]" = [ g v ];
    "[ (g v) ]" =  [ (g v) ];
    "h 1" = h 1;
    "h 1 2" = h 1 2;
}