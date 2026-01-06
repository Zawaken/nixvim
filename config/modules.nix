{ lib, pkgs, config, ... }:
# let
#   plugins = [
#
#   ];
# in
{
  options = {
    utils = lib.mkOption rec {
      type = lib.types.listOf <| lib.types.either lib.types.path <| lib.types.attrsOf lib.types.str;
      default = lib.filesystem.concatPaths {
        paths = [../utils];
        suffix = ".lua";
        filterDefault = false;
      };
      description = "List of lua files or attribute sets with inline lua code to be added to the lua/utils directory";
      apply = paths: default ++ paths;
    };
  };
  config = {
    # TODO: Merge files/strings with same name
    #  Might need to add local M = {} to the top of the file and return M at end
    extraFiles = let
      attrUtils = builtins.filter builtins.isAttrs config.utils;
      pathUtils = builtins.filter builtins.isPath config.utils;

      attrFiles =
        builtins.concatLists
        <| builtins.map (
          util:
            builtins.map (name: {
              name = "lua/utils/${name}.lua";
              value = {text = builtins.getAttr name util;};
            })
            <| builtins.attrNames util
        )
        attrUtils;

      pathFiles =
        builtins.map (util: {
          name = "lua/utils/${builtins.baseNameOf (toString util)}";
          value = {source = util;};
        })
        pathUtils;
    in
      builtins.listToAttrs <| attrFiles ++ pathFiles;
    modules = lib.enable [
      [ "colorscheme" "tokyonight"]
      "bufferline"
      "completions"
      "folds"
      "lsp"
      "lualine"
      "mini"
      "neorg"
      "noice"
      "notify"
      "obsidian"
      "qmk"
      "telescope"
      "treesitter"
      "whichkey"
    ];
    plugins = lib.enable [
      "nix"
      "neocord"
      "trouble"
      "gitsigns"
      "intellitab"
      "web-devicons"
    ];

    # plugins = builtins.listToAttrs (map (name: {
    #   name = name;
    #   value = { enable = true; };
    # }) plugins);

    extraPlugins = with pkgs.vimPlugins; [
      nui-nvim
      vim-sleuth

      yuck-vim
    ];
  };
}
