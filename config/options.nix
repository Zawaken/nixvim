{
  config = {
    opts = {
      backup = false;
      swapfile = false;
      undofile = true;
      mouse = "";
      smartcase = true;
      updatetime = 300;
      timeoutlen = 1000;
      cursorline = false;
      signcolumn = "yes";
      wrap = false;
      foldmethod = "syntax";

      number = true;
      relativenumber = true;
      list = true;
      listchars = {
        tab = ":┊»";
        eol = "¬";
      };
      clipboard = "unnamedplus";
      splitbelow = true;
      splitright = true;
      ignorecase = true;
      filetype = "on";
      hlsearch = true;

      tabstop = 2;
      shiftwidth = 2;
      smartindent = true;
      smarttab = true;
      autoindent = true;
      expandtab = true;
    };
  };
}
