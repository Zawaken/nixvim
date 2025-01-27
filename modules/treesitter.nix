{ config, lib, ... }:
{
  options.modules.treesitter.enable = lib.mkEnableOption "treesitter";

  config = lib.mkIf config.modules.treesitter.enable {
    plugins.treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
      };
    };
  };
}
