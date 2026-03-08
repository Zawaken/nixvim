{
  config,
  lib,
  pkgs,
  ...
}:

# TODO https://github.com/kaplanelad/shellfirm

lib.utils.mkLanguageModule config "shell" {
  plugins = {
    lsp.servers = {
      yamlls.enable = true;
    };

    conform-nvim.settings = {
      formatters_by_ft.yaml = [
        "yamlfix"
      ];

      formatters = {
        yamlfix.command = lib.getExe pkgs.yamlfix;
      };
    };
  };
}
