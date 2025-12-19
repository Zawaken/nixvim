{ pkgs, lib, config, utils, ... }:
{
  options.modules.folds.enable = lib.mkEnableOption "folds";

  config = lib.mkIf config.modules.folds.enable {
    extraPlugins = [{
      plugin = pkgs.vimPlugins.pretty-fold;
      config = lib.utils.viml.fromLua ''
        require("pretty-fold").setup({
          keep_indentation = false,
          fill_char = ' ',
          sections = {
            left = {
              function() return string.rep(' ', vim.fn.indent(vim.v.foldstart)) end, '»', 'content', function() return string.rep('›', vim.v.foldlevel - 1) end
            },
            right = {
              '{ ', 'number_of_folded_lines', ' }  ',
            },
          },
        })
      '';
    }];
  };
}
