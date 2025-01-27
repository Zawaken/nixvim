{ config, lib, ... }:
{
  options.modules.whichkey.enable = lib.mkEnableOption "whichkey";

  config = lib.mkIf config.modules.whichkey.enable {
    plugins.which-key = {
      enable = true;
    };
  };
}
