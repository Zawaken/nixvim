{ pkgs, lib, config, ... }:
{
  options.modules.folds.enable = lib.mkEnableOption "folds";

  config = lib.mkIf config.modules.folds.enable {
    extraPlugins = [{
      plugin = pkgs.vimPlugins.pretty-fold-nvim;
      config = ''
        lua require("pretty-fold").setup()
      '';
    }];
  };
}
