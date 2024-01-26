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
    # {
    #   event = [ "BufReadPost" ];
    #   pattern = [ "*" ];
    #   # command = [ "if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif" ];
    #   command = "if line(\"'\"\") > 1 && line(\"'\"\") <= line(\"$\") | exe \"normal! g'\"\" | endif";
    # }
  ];
}
