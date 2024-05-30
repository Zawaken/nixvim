{ pkgs, ... }:
let
  plugins = [
    "nix"
    "neocord"
    "trouble"
    "gitsigns"
    "intellitab"
  ];
in {
  imports = [
    ./bufferline.nix
    ./completions.nix
    # ./folds.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    ./neorg.nix
    ./noice.nix
    ./notify.nix
    ./obsidian.nix
    ./qmk.nix
    ./telescope.nix
    ./treesitter.nix
    ./whichkey.nix
  ];

  plugins = builtins.listToAttrs (map (name: {
    name = name;
    value = { enable = true; };
  }) plugins);

  extraPlugins = with pkgs.vimPlugins; [
    nvim-web-devicons
    nui-nvim
    vim-sleuth

    yuck-vim
  ];
}
