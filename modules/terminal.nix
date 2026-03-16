{ config, lib, pkgs, ... }:
lib.mkModule config "terminal" {
  plugins = {
    toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        open_mapping = "[[<M-n>]]";
        size = 30;
      };
    };
  };
  keymaps = with lib.utils.keymaps; [
    (mkKeymap' "<leader>t" "<CMD>ToggleTerm<CR>" "Toggle Zen")
  ];
}
