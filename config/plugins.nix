{ lib, pkgs, config, ... }:
# let
#   plugins = [
#
#   ];
# in
{
  config = {
  modules = lib.enable [
    [ "colorscheme" "tokyonight"]
    "bufferline"
    "cmp"
    "folds"
    "lsp"
    "lualine"
    "mini"
    "neorg"
    "noice"
    "notify"
    "obsidian"
    "qmk"
    "telescope"
    "treesitter"
    "whichkey"
  ];
  plugins = lib.enable [
    "nix"
    "neocord"
    "trouble"
    "gitsigns"
    "intellitab"
    "web-devicons"
  ];

  # plugins = builtins.listToAttrs (map (name: {
  #   name = name;
  #   value = { enable = true; };
  # }) plugins);

  extraPlugins = with pkgs.vimPlugins; [
    nui-nvim
    vim-sleuth

    yuck-vim
  ];
  };
}
