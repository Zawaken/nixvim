{ config, ... }: {
  globals = {
    mapleader = ",";
    maplocalleader = ",";
  };
  keymaps = let
    mkMove = key: dir: {
      inherit key;
      action = "<CMD>lua vim.api.nvim_command('normal! ' .. (vim.v.count == 0 and 1 or vim.v.count) .. 'g${dir}')<CR>";
      mode = [ "n" "i" "v" ];
      options = {
        noremap = true;
        nowait = true;
        silent = true;
      };
    };
  in [
    (mkMove "<Up>" "k")
    (mkMove "<Down>" "j")
    (mkMove "<Home>" "^")
    (mkMove "<End>" "$")
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
