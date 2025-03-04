self: super: {
  vimPlugins =
    super.vimPlugins
  // {
    pretty-fold = super.vimUtils.buildVimPlugin rec {
      name = "pretty-fold.nvim";
      src = super.fetchFromGitHub {
        owner = "bbjornstad";
        repo = name;
        rev = "1eb18f228972e86b7b8f5ef33ca8091e53fb1e49";
        hash = "sha256-0cHPm+JPGoYsjJEg3eIWv2Td1S+LQYBRbp71XPQsWMg=";
      };
    };
  };
}
