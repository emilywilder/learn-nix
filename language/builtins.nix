let
  lib = import <nixpkgs/lib>;
  ex_toString = {
    a = 1;
    __toString = self: "a: " + toString self.a;
  };
  gt = x: y: y > x;
  derivationAttrs = {
    name = builtins.baseNameOf ./.;
    system = builtins.currentSystem;
    builder = "/bin/seashell";
  };
  drv = derivation derivationAttrs;
  ex_attrs = { a = 1; b = 2; };
  ex_abs_path = "/this/is/an/absolute/path";
  ex_rel_path = "./this/is/a/relative/path";
in
builtins.trace ''

Definitions:
  ex_toString = { a = 1; __toString = self: ...; };
  gt = x: y: y > x;
  derivationAttrs = {
    name = builtins.baseNameOf ./.;
    system = builtins.currentSystem;
    builder = "/bin/seashell";
  };
  ex_attrs = { a = 1; b = 2; };
  ex_abs_path = "/this/is/an/absolute/path";
  ex_rel_path = "./this/is/a/relative/path";

Applications:''
{
  #  derivation attrs
  "derivation derivationAttrs" = {
    "drvPath" = drv.drvPath;
    "drvAttrs" = drv.drvAttrs;
  };

  #  abort s
  #   <Not Implemented> like builtins.throw, but cannot be caught

  #  add e1 e2
  "builtins.add 1 2" = builtins.add 1 2;

  #  addDrvOutputDependencies s
  # TODO:

  #  all pred list
  "builtins.all (gt 3) (lib.range 1 5)" = builtins.all (gt 3) (lib.range 1 5);

  #  any pred list
  "builtins.any (gt 3) (lib.range 1 5)" = builtins.any (gt 3) (lib.range 1 5);

  #  attrNames set
  "builtins.attrNames ex_attrs" = builtins.attrNames ex_attrs;

  #  attrValues set
  "builtins.attrValues ex_attrs" = builtins.attrValues ex_attrs;

  #  baseNameOf x
  "builtins.baseNameOf ex_abs_path" = builtins.baseNameOf ex_abs_path;

  #  bitAnd e1 e2
  "builtins.bitAnd 1 0" = builtins.bitAnd 1 0;

  #  bitOr e1 e2
  "builtins.bitOr 1 0" = builtins.bitOr 1 0;

  #  bitXor e1 e2
  "builtins.bitXor 1 1" = builtins.bitXor 1 1;

  #  break v
  "builtins.break \"Not in debug mode\"" = builtins.break "Not in debug mode";
  # FIXME: demonstrate how this functions in a debugging session

  #  builtins
  "builtins.isAttrs builtins" = builtins.isAttrs builtins;

  #  catAttrs attr list
  "builtins.catAttrs \"a\" [{a=1;} {a=2;} {b=3;} {a=4;}]" = builtins.catAttrs "a" [{a=1;} {a=2;} {b=3;} {a=4;}];

  #  ceil double
  "builtins.ceil 3.1415926535" = builtins.ceil 3.1415926535;

  #  compareVersions s1 s2
  "builtins.compareVersions \"1\" \"1.1\"" = builtins.compareVersions "1" "1.1";

  #  concatLists lists
  "builtins.concatLists [[ 1 2 ] [ 3 ]]" = builtins.concatLists [[ 1 2 ] [ 3 ]];

  #  concatMap f list
  #  example inspired from https://noogle.dev/f/builtins/concatMap
  "builtins.concatMap (x: builtins.concatLists [[x] [9]]) [1 2]" = builtins.concatMap
    (x: builtins.concatLists [[x] [9]])
    [1 2];

  #  concatStringsSep separator list
  "builtins.concatStringsSep \"/\" [ \"some\" \"path\" ];" = builtins.concatStringsSep "/" [ "some" "path" ];
  #  convertHash args
  #  currentSystem
  #  currentTime
  #  deepSeq e1 e2
  #  dirOf s
  #  div e1 e2
  #  elem x xs
  #  elemAt xs n
  #  false
  #  fetchClosure args
  #  fetchGit args
  #  fetchTarball args
  #  fetchTree input
  #  fetchurl arg
  #  filter f list
  #  filterSource e1 e2
  #  findFile search-path lookup-path
  #  flakeRefToString attrs
  #  floor double
  #  foldl' op nul list
  #  fromJSON e
  #  fromTOML e
  #  functionArgs f
  #  genList generator length
  #  genericClosure attrset
  #  getAttr s set
  #  getContext s
  #  getEnv s
  #  getFlake args
  #  groupBy f list
  #  hasAttr s set
  #  hasContext s
  #  getContext
  #  hashFile type p
  #  hashString type s
  #  head list
  #  import path
  #  intersectAttrs e1 e2
  #  isAttrs e
  #  isBool e
  #  isFloat e
  #  isFunction e
  #  isInt e
  #  isList e
  #  isNull e
  #  isPath e
  #  isString e
  #  langVersion
  #  length e
  #  lessThan e1 e2
  #  listToAttrs e
  #  map f list
  #  mapAttrs f attrset
  #  match regex str
  #  mul e1 e2
  #  nixPath
  #  nixVersion
  #  null
  #  outputOf derivation-reference output-name
  #  parseDrvName s
  #  parseFlakeRef flake-ref
  #  partition pred list
  #  path args
  #  pathExists path
  #  placeholder output
  #  readDir path
  #  readFile path
  #  readFileType p
  #  removeAttrs set list
  #  replaceStrings from to s
  #  seq e1 e2
  #  sort comparator list
  #  split regex str
  #  splitVersion s
  #  storeDir
  #  storePath path
  #  stringLength e
  #  sub e1 e2
  #  substring start len s
  #  tail list
  #  throw s
  #  toFile name s
  #  toJSON e
  #  toPath s
  #  toString e
  "builtins.toString ex_toString" = builtins.toString ex_toString;

  #  toXML e
  #  trace e1 e2
  #  traceVerbose e1 e2
  #  true
  #  tryEval e
  # FIXME: try and get the double quotes to not display escaped
  "builtins.tryEval (throw \"error\")" = builtins.tryEval (throw "error");

  #  typeOf e
  #  unsafeDiscardOutputDependency s
  # TODO:

  #  unsafeDiscardStringContext s
  # TODO:

  #  warn e1 e2
  #  zipAttrsWith f list
}