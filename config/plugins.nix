{ utils, pkgs, ... }:
# let
#   plugins = [
#
#   ];
# in
{
  modules = utils.enable [
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
  plugins = utils.enable [
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
}
