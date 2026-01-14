{ inputs, pkgs, config, lib, ... }:
{
  options.modules.neorg.enable = lib.mkEnableOption "neorg";

  config = lib.mkIf config.modules.neorg.enable {
    keymaps = [
      {
        key = "<leader>i";
        action = "<CMD>Neorg index<CR>";
      }
    ];
    plugins = {
      neorg = {
        enable = true;
        package = pkgs.vimPlugins.neorg;
        settings = {
          load = {
            "core.defaults" = {
              __empty = null;
            };
            "core.concealer" = {
              __empty = null;
            };
            "core.dirman" = {
              config = {
                default_workspace = "notes";
                workspaces = {
                  notes = "~/.notes/notes";
                };
              };
            };
          };
        };
      };
      treesitter.grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars ++ [ pkgs.vimPlugins.treesitter-neorg-grammar ];
    };
    extraPlugins = with pkgs.vimPlugins; [ treesitter-neorg-grammar ];
  };
}
