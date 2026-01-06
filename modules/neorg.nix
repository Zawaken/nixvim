{ config, lib, ... }:
{
  options.modules.neorg.enable = lib.mkEnableOption "neorg";

  config = lib.mkIf config.modules.neorg.enable {
    keymaps = [
      {
        key = "<leader>i";
        action = "<CMD>Neorg index<CR>";
      }
    ];
    plugins.neorg = {
      enable = true;
      settings = {
        load = {
          "core.defaults" = {
            __empty = null;
          };
          "core.concealer" = {
            __empty = null;
          };
          "core.dirman" = {
            config = {
              default_workspace = "notes";
              workspaces = {
                notes = "~/.notes/notes";
              };
            };
          };
        };
      };
    };
  };
}
