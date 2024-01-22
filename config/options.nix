{ pkgs, ... }: {
	config = {
		options = {
			number = true;
			mouse = "";
			relativenumber = true;
			smartindent = true;
			smartcase = true;
			backup = false;
			swapfile = false;
			undofile = true;
			updatetime = 300;
			timeoutlen = 1000;
			tabstop = 2;
			shiftwidth = 2;
			cursorline = false;
			signcolumn = "yes";
			wrap = false;
			foldmethod = "marker";
			foldmarker = "{{{,}}}";
			list = true;
			listchars = "tab:┊»,eol:¬";
			autoindent = true;
			clipboard = "unnamedplus";
			splitbelow = true;
			splitright = true;
			ignorecase = true;
			fileencoding = "utf-8";
		};
	};
}
