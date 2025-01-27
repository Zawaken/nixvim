{ config, lib, pkgs, helpers, ... }:
{
  options.modules.telescope.enable = lib.mkEnableOption "telescope";

  config = lib.mkIf config.modules.telescope.enable {
    plugins.telescope = {
      enable = true;
      extensions = {
        ui-select.enable = true;
        fzy-native = {
          enable = true;
          settings = {
            override_file_sorter = true;
            override_generic_sorter = true;
          };
        };
      };
      settings = {
        defaults.mappings = {
          i = {
            "<esc>" = helpers.mkRaw "require('telescope.actions').close";
          };
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = (pkgs.vimUtils.buildVimPlugin {
          name = "search.nvim";
          src = pkgs.fetchFromGitHub {
              owner = "FabianWirth";
              repo = "search.nvim";
              rev = "7b8f2315d031be73e14bc2d82386dfac15952614";
              hash = "sha256-88rMEtHTk5jEQ00YleSr8x32Q3m0VFZdxSE2vQ+f0rM=";
          };
          doCheck = false;
        });
        config = ''
          lua builtin = require('telescope.builtin')
          lua require("search").setup({
          \  initial_tab = 1,
          \  tabs = {
          \    { "Files", builtin.find_files },
          \    { "Grep", builtin.live_grep },
          \    { "Git Files", builtin.git_files, available = function() return vim.fn.isdirectory(".git") == 1 end },
          \  }
          \ })
        '';
      }
    ];

    keymaps = [
      {
        key = "<leader>f";
        action = "<cmd>lua require'search'.open()<CR>";
        options.desc = "Search.nvim";
      }
      {
        key = "<leader>F";
        action = "<CMD>Telescope live_grep theme=ivy<CR>";
        options.desc = "Telescope Live Grep Ivy";
      }
      {
        key = "<leader>b";
        action = "<CMD>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())<CR>";
        options.desc = "Telescope Bufferlist Dropdown";
      }
    ];
  };
}
