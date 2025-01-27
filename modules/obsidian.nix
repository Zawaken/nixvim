{ config, lib, ... }:
{
  options.modules.obsidian.enable = lib.mkEnableOption "obsidian";

  config = lib.mkIf config.modules.obsidian.enable {
    plugins.obsidian = {
      enable = true;
      settings = {
        picker.name = "telescope.nvim";
        workspaces = [
          {
            name = "notes";
            path = "~/Documents/notes/";
          }
        ];
      };
    };
    files."ftplugin/markdown.lua" = {
      opts.conceallevel = 2;
    };
  };
}
