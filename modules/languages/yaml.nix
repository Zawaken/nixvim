{ config, lib, pkgs, ... }:

lib.utils.mkLanguageModule config "yaml" {
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
