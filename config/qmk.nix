{ lib, ...}:
let ortho4x12 = [
  "x x x x x x x x x x x x"
  "x x x x x x x x x x x x"
  "x x x x x x x x x x x x"
  "x x x x x x x x x x x x"
];
ortho4x12LayoutString = lib.strings.concatMapStringsSep ",\n" (s: "'${s}'") ortho4x12;

ortho5x12 = [
  "x x x x x x x x x x x x"
  "x x x x x x x x x x x x"
  "x x x x x x x x x x x x"
  "x x x x x x x x x x x x"
  "x x x x x x x x x x x x"
];
ortho5x12LayoutString = lib.strings.concatMapStringsSep ",\n" (s: "'${s}'") ortho5x12;

in {
  plugins.qmk = {
    enable = true;
    settings = {
      name = "LAYOUT_preonic_grid";
      layout = ortho5x12;
    };
  };

  autoGroups.Qmk.clear = true;
  autoCmd = [
    {
      group = "Qmk";
      event = [ "BufEnter" ];
      pattern = [ "*preonic/keymap.c" ];
      callback = { __raw = "function() require('qmk').setup({
                    name = 'LAYOUT_preonic_grid',
                    layout = {
                      ${ortho5x12LayoutString}
                    }}) end"; };
    }
    { # planck keymap
      group = "Qmk";
      event = [ "BufEnter" ];
      pattern = [ "*planck/keymap.c" ];
      callback = { __raw = "function() require('qmk').setup({
                    name = 'LAYOUT_planck_grid',
                    comment_preview = { position = 'inside' },
                    layout = {
                      ${ortho4x12LayoutString}
                    }}) end"; };
    }
    { # framework/ortho_5x12 keymap
      group = "Qmk";
      event = [ "BufEnter" ];
      pattern = [ "*framework/keymap.c" ];
      callback = { __raw = "function() require('qmk').setup({
                    name = 'LAYOUT_ortho_5x12',
                    layout = {
                      ${ortho5x12LayoutString}
                    }}) end"; };
    }
    { # Air40/ortho_4x12 layout
      group = "Qmk";
      event = [ "BufEnter" ];
      pattern = [ "*air40/keymap.c" ];
      callback = { __raw = "function() require('qmk').setup({
                    name = 'LAYOUT_ortho_4x12',
                    layout = {
                      ${ortho4x12LayoutString}
                    }}) end"; };
    }
    { # Boardsource Lulu layout
      group = "Qmk";
      event = [ "BufEnter" ];
      pattern = [ "*lulu/keymap.c" ];
      callback = { __raw = "function() require('qmk').setup({
                    name = 'LAYOUT',
                    layout = {
                      'x x x x x x _ _ _ x x x x x x',
                      'x x x x x x _ _ _ x x x x x x',
                      'x x x x x x _ _ _ x x x x x x',
                      'x x x x x x x _ x x x x x x x',
                      '_ _ _ x x x x _ x x x x _ _ _'
                    }}) end"; };
    }
    { # Blank space layout, currently doesn't work
      group = "Qmk";
      event = [ "BufEnter" ];
      pattern = [ "*.keymap" ];
      callback = { __raw = "function() require('qmk').setup({
                    name = 'meh',
                    variant = 'zmk',
                    layout = {
                      ${ortho4x12LayoutString}
                    }}) end"; };
    }
  ];
}
