{ config, lib, ... }:
{
  options.modules.treesitter.enable = lib.mkEnableOption "treesitter";

  config = lib.mkIf config.modules.treesitter.enable {
    plugins.treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };
        indent.enable = true;
        folding.enable = true;
      };
    };
  };
}
