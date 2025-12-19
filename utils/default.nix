args @ {
  inputs,
  system,
  lib,
  pkgs,
  ...
}: rec {
  viml = import ./viml.nix args;

  keymaps = import ./keymaps.nix args;

  fill = value: elems:
    lib.foldl' (acc: elem:
      acc // lib.setAttrByPath (if builtins.isList elem then elem else [elem])
      value) { } elems;

  enable = elems: fill { enable = true; } elems;
  disable = elems: fill { enable = false; } elems;
}
