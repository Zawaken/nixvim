{
  autoCmd = [
    { # Automatically deletes all trailing whitespace on save
      event = [ "BufWritePre" ];
      pattern = [ "*" ];
      command = "%s/\\s\\+$//e";
    }
    { # Disable automatic commenting on newline
      event = [ "FileType" "BufNewFile" "BufRead" ];
      pattern = [ "*" ];
      command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o";
    }
    { # Set filetype to C for ZMK keymap files
      event =   [ "BufNewFile" "BufRead" ];
      pattern = [ "*.keymap" ];
      command = "setfiletype c";
    }
    { # Remember what line I last closed neovim on
      event = [ "BufReadPost" ];
      pattern = [ "*" ];
      command = ''if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif'';
    }
    {
      event = [ "FileType" ];
      pattern = [ "norg" "neorg" ];
      callback = { __raw = ''
      function() 
        if pcall(vim.treesitter.start) then 
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" 
          vim.bo.indentexpr = "vi:lua.require'nvim-treesitter'.indentexpr()" 
        end
      end'';};
    }
  ];
}
