{ config, lib, ... }:
lib.mkModule config "zen" {
  plugins = {
    zen-mode = {
      enable = true;
      settings = {
        plugins = {
          gitsigns.enabled = true;
        };
        window.options = {
          signcolumn = "no";
          list = false;
        };
      };
    };
    twilight.enable = true;
    twilight.settings.context = 6;
  };
  keymaps = with lib.utils.keymaps; [
    (mkKeymap' "<leader>z" "<CMD>ZenMode<CR>" "Toggle Zen")
  ];
}
