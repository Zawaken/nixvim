{ config, lib, helpers, ... }:
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
    keymaps = with lib.utils.keymaps; [
      (mkKeymap' "<leader>e" (helpers.mkRaw ''
        function()
          local files = require('mini.files')
          if not files.close() then
            files.open(files.get_latest_path())
          end
        end
      '') "File Browser")
    ];
  };
}
