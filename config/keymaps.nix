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
    { # https://stackoverflow.com/a/21000307
      key = "<up>";
      action = "(v:count == 0 ? 'gk' : 'k')";
      mode = [ "n" ];
      options = {
        desc = "Move cursor up (including wrapped lines)";
        noremap = true;
        expr = true;
        nowait = true;
        silent = true;
      };
    }
    {
      key = "<down>";
      action = "(v:count == 0 ? 'gj' : 'j')";
      mode = [ "n" ];
      options = {
        desc = "Move cursor down (including wrapped lines)";
        noremap = true;
        expr = true;
        nowait = true;
        silent = true;
      };
    }
  ];
}
