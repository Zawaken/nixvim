{ config, lib, ... }:
{
  options.modules.lualine.enable = lib.mkEnableOption "lualine";

  config = lib.mkIf config.modules.lualine.enable {
    plugins.lualine = {
      enable = true;
      settings = {
        options = {
          theme = "tokyonight";
          sectionSeparators.left = "";
          sectionSeparators.right = "";
          componentSeparators.left = "";
          componentSeparators.right = "";
          extensions = [
            "trouble"
          ];
        };
      };
    };
  };
}
