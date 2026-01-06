{ config, lib, ... }: {
  globals = {
    mapleader = ",";
    maplocalleader = ",";
  };
  keymaps = with lib.utils.keymaps; [
    (mkKeymap' "<leader>c" "<CMD>nohlsearch<CR>" "Clear Search Selection")
    (mkKeymap' "<leader>n" "<CMD>lua CopyMode()<CR>" "Enter CopyMode")
  ];
}
