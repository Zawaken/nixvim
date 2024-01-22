{ pkgs, ... }: {
  extraPlugins = [{
    plugin = pkgs.vimPlugins.pretty-fold-nvim;
    config = ''
      lua require("pretty-fold").setup()
    '';
  }];
}
