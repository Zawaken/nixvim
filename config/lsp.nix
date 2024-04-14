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
        nil_ls.enable = true;
        pyright.enable = true;
        terraformls.enable = true;
        tsserver.enable = true;
      };
    };
  };
}
