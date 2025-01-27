{ config, lib, ... }:
{
  options.modules.noice.enable = lib.mkEnableOption "noice";

  config = lib.mkIf config.modules.noice.enable {
    plugins.noice = {
      enable = true;
      settings = {
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
          inc_rename = false;
          lsp_doc_border = false;
        };
      };
    };
  };
}
