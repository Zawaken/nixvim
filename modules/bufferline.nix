{ config, lib, ... }:
{
  options.modules.bufferline.enable = lib.mkEnableOption "bufferline";

  config = lib.mkIf config.modules.bufferline.enable {
    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          numbers = "buffer_id";
          always_show_bufferline = false;
          show_buffer_close_icons = false;
        };
      };
    };
  };
}
