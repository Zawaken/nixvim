{ pkgs, ... }:
let
  plugins = [
    "nix"
    "telescope"
    "presence-nvim"
    "which-key"
    "trouble"
    "gitsigns"
    "intellitab"
  ];
in {
  imports = [
    ./bufferline.nix
    ./completions.nix
    ./folds.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    ./neorg.nix
    ./noice.nix
    ./treesitter.nix
  ];

  plugins = builtins.listToAttrs (map (name: {
    name = name;
    value = { enable = true; };
  }) plugins);

  extraPlugins = with pkgs.vimPlugins; [
    nvim-web-devicons
    nui-nvim
    vim-sleuth
  ];
}
