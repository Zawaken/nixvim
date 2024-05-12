{ pkgs, ... }:
{
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
          "<esc>".__raw = "require('telescope.actions').close";
        };
      };
    };
  };
  extraPlugins = [
    {
      plugin = (pkgs.vimUtils.buildVimPlugin {
        name = "search.nvim";
        src = pkgs.fetchFromGitHub {
            owner = "FabianWirth";
            repo = "search.nvim";
            rev = "cfde7b91c713d17e590aad2f0d22a68ddeba3043";
            hash = "sha256-nLDwEkpu+SmcJgnjhtqaXkeeX8YwPp3S2QYKNXaTJCI=";
        };
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
}
