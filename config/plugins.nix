{ pkgs, ... }:
let
  plugins = [
    "nix"
    "telescope"
    "which-key"
    "trouble"
  ];
in {
  imports = [
    ./bufferline.nix
    ./completions.nix
    ./folds.nix
    ./lsp.nix
    ./lualine.nix
    ./mini.nix
    ./treesitter.nix
  ];

  plugins = builtins.listToAttrs (map (name: {
    name = name;
    value = { enable = true; };
  }) plugins);

  extraPlugins = with pkgs.vimPlugins; [
    nvim-web-devicons
  ];
}
