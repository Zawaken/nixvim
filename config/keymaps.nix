{ config, ... }: {
  globals = {
    mapleader = ",";
    maplocalleader = ",";
  };
  keymaps = [
    {
      key = "<leader>c";
      action = "<CMD>noh<CR>";
      options.desc = "Clear Search Selection";
    }
    {
      key = "<leader>n";
      action= "<CMD>lua CopyMode()<CR>";
      options.desc = "Enter CopyMode";
    }
    {
      key = "<leader>e";
      action = "<CMD>lua MiniFiles.open()<CR>";
      options.desc = "Open MiniFiles";
    }
  ];
}
