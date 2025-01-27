{ lib, utils, ... }: {
  imports = [
    ./autocommands.nix
    ./keymaps.nix
    ./options.nix
    ./plugins.nix
  ] ++ utils.umport { path = ../modules; };

  extraConfigLuaPre =
    lib.concatStringsSep "\n" [ (builtins.readFile ./util.lua) ];
}
