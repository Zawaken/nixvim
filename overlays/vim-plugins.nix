_: _: super: {
  vimPlugins =
    super.vimPlugins
    // {
      pretty-fold = super.vimUtils.buildVimPlugin {
        name = "pretty-fold.nvim";
        src = super.fetchFromGitHub {
          owner = "bbjornstad";
          repo = "pretty-fold.nvim";
          rev = "1eb18f228972e86b7b8f5ef33ca8091e53fb1e49";
          hash = "sha256-0cHPm+JPGoYsjJEg3eIWv2Td1S+LQYBRbp71XPQsWMg=";
        };
      };
      search = super.vimUtils.buildVimPlugin {
        name = "search.nvim";
        src = super.fetchFromGitHub {
            owner = "FabianWirth";
            repo = "search.nvim";
            rev = "7b8f2315d031be73e14bc2d82386dfac15952614";
            hash = "sha256-88rMEtHTk5jEQ00YleSr8x32Q3m0VFZdxSE2vQ+f0rM=";
        };
        doCheck = false;
      };
    };
}
