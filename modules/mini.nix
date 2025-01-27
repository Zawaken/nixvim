{ config, lib, ... }:
{
  options.modules.mini.enable = lib.mkEnableOption "mini";

  config = lib.mkIf config.modules.mini.enable {
    plugins.mini = {
      enable = true;
      modules = {
        pairs = { };
        comment = { };
        align = { };
        files = {
          mappings = {
            go_in_plus = "<Right>";
            go_out_plus = "<Left>";
          };
        };
      };
    };
  };
}
