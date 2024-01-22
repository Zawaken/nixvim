{
  plugins = {
    lspkind.enable = true;
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        cssls.enable = true;
        hls.enable = true;
        lua-ls.enable = true;
        pyright.enable = true;
        rnix-lsp.enable = true;
        terraformls.enable = true;
        tsserver.enable = true;
      };
    };
  };
}
