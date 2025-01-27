{ config, lib, ... }: {
  options.modules.colorscheme.tokyonight.enable = lib.mkEnableOption "tokyonight";

  config = lib.mkIf config.modules.colorscheme.tokyonight.enable {
    colorschemes.tokyonight = {
        enable = true;
    };
  };
}
