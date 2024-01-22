{ config, ... }: {
  globals = {
    mapleader = ",";
    maplocalleader = ",";
  };
  keymaps = [
    {
      key = "<leader>c";
      action = "<CMD>noh<CR>";
    }
    {
      key = "<leader>n";
      action= "<CMD>lua CopyMode()<CR>";
    }
    {
      key = "<leader>f";
      action = "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<CR>";
    }
    {
      key = "<leader>F";
      action = "<CMD>Telescope live_grep theme=ivy<CR>";
    }
    {
      key = "<leader>b";
      action = "<CMD>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())<CR>";
    }
    {
      key = "<leader>e";
      action = "<CMD>lua MiniFiles.open()<CR>";
    }
  ];
}
