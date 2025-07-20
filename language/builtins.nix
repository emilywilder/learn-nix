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
in
builtins.trace ''


ex_toString = { a = 1; __toString = self: ...; };
gt = x: y: y > x;
derivationAttrs = {
  name = builtins.baseNameOf ./.;
  system = builtins.currentSystem;
  builder = "/bin/seashell";
};
''
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
  #  builtins.unsafeDiscardOutputDependency
  #  all pred list
  "builtins.all (gt 3) (lib.range 1 5)" = builtins.all (gt 3) (lib.range 1 5);
  #  any pred list
  "builtins.any (gt 3) (lib.range 1 5)" = builtins.any (gt 3) (lib.range 1 5);
  #  attrNames set
  #  attrValues set
  #  baseNameOf x
  #  bitAnd e1 e2
  #  bitOr e1 e2
  #  bitXor e1 e2
  #  break v
  #  builtins
  #  catAttrs attr list
  #  ceil double
  #  compareVersions s1 s2
  #  concatLists lists
  #  concatMap f list
  #  concatStringsSep separator list
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
  #  builtins.storePath
  #  fetchGit args
  #  fetchTarball args
  #  fetchTree input
  #  fetchurl arg
  #  filter f list
  #  filterSource e1 e2
  #  findFile search-path lookup-path
  #  builtins.nixPath
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
  #  builtins.filterSource
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
  #  builtins.fetchClosure
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
  #  builtins.addDrvOutputDependencies
  #  builtins.addDrvOutputDependencies
  #  unsafeDiscardStringContext s
  #  warn e1 e2
  #  zipAttrsWith f list
}