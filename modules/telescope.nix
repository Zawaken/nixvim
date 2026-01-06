{ config, lib, pkgs, helpers, ... }:
{
  options.modules.telescope.enable = lib.mkEnableOption "telescope";

  config = lib.mkIf config.modules.telescope.enable {
    plugins = {
      telescope = {
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
        settings.defaults = {
          mappings = {
            i = {
              "<esc>" = helpers.mkRaw "require('telescope.actions').close";
              "<C-h>" = "which_key";
            };
          };
        };
        extensions = {
          frecency = {
            enable = true;
          };
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = search;
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

    keymaps = with lib.utils.keymaps; [
      (mkKeymap' "<leader>f" (helpers.mkRaw ''
        function()
          require('search').open()
        end
      '') "Find Files")
      (mkKeymap' "<leader>F" (helpers.mkRaw ''
        function()
          require('telescope.builtin').live_grep({ theme=ivy })
        end
      '') "Live Grep")
      (mkKeymap' "<leader>b" (helpers.mkRaw ''
        function()
          require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())
        end
      '') "Bufferlist")
    ];
  };
}
