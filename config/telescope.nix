{
  keymaps = [
    {
      key = "<leader>f";
      action = "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<CR>";
      options.desc = "Telescope Find Files Dropdown";
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
  };
}
