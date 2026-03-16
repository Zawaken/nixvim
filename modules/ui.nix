{ config, lib, ... }:
let
  indentchar = "▏";
  colchar = "▕";
in
  lib.mkModule config "ui" {
    plugins = {
      nui.enable = true;

      numbertoggle.enable = true;

      notify = {
        enable = true;
      };
      noice = {
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
      snacks = {
        enable = true;
        settings.indent = {
          enabled = true;
          animate.enabled = true;
          indent.char = indentchar;
          scope.char = indentchar;
        };
      };
      # virt-column = {
      #   enable = true;
      #   settings = {
      #     char = colchar;
      #     virtcolumn = "80,100,120";
      #   };
      # };
    };
}
