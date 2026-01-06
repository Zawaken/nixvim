{ config, lib, ... }:
{
  options.modules.lsp.enable = lib.mkEnableOption "lsp";

  config = lib.mkIf config.modules.lsp.enable {
    plugins = {
      lspkind.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;
        # servers = {
        #   bashls.enable = true;
        #   clangd.enable = true;
        #   cssls.enable = true;
        #   hls = {
        #     enable = true;
        #     installGhc = true;
        #   };
        #   lua_ls.enable = true;
        #   nil_ls.enable = true;
        #   pyright.enable = true;
        #   terraformls.enable = true;
        #   ts_ls.enable = true;
        # };
      };
    };
  };
}
