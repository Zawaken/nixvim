{ config, ... }: {
    extraConfigLua = ''
    function Move(motion)
      vim.api.nvim_command('normal! ' .. (vim.v.count == 0 and 1 or vim.v.count) .. 'g' .. motion)

      if motion == '$' then
        local col = vim.api.nvim_win_get_cursor(0)[2] + 1
        local line = vim.api.nvim_get_current_line()

        if col == #line then
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<End>', true, false, true), 'n', false)
        end
      end
    end
  '';

  globals = {
    mapleader = ",";
    maplocalleader = ",";
  };
  keymaps = let
    mkMove = key: motion: {
      inherit key;
      action = "<CMD>lua Move('${motion}')<CR>";
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
    (mkMove "<Home>" "^") # or 0
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
