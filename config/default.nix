{ lib, ... }: {
  imports = [
    ./keymaps.nix
    ./options.nix
    ./plugins.nix
    ./theme.nix
  ];

	extraConfigLuaPre =
		lib.concatStringsSep "\n" [ (builtins.readFile ./util.lua) ];
}
