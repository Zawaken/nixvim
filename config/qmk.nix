{
  plugins.qmk = {
    enable = true;
    settings = {
      name = "LAYOUT_preonic_grid";
      layout = [
        "x x x x x x x x x x x x"
        "x x x x x x x x x x x x"
        "x x x x x x x x x x x x"
        "x x x x x x x x x x x x"
        "x x x x x x x x x x x x"
      ];
    };
  };

  autoGroups = {
    Qmk.clear = true;
  };
  autoCmd = [
    { # planck keymap
      group = "Qmk";
      event = [ "BufEnter" ];
      pattern = [ "*planck/keymap.c" ];
      callback = { __raw = "function() require('qmk').setup({
                    name = 'LAYOUT_planck_grid',
                    layout = {
                      'x x x x x x x x x x x x',
                      'x x x x x x x x x x x x',
                      'x x x x x x x x x x x x',
                      'x x x x x x x x x x x x'
                    }}) end"; };
    }
    {
      group = "Qmk";
      event = [ "BufEnter" ];
      pattern = [ "*framework/keymap.c" ];
      callback = { __raw = "function() require('qmk').setup({
                    name = 'LAYOUT_ortho_5x12',
                    layout = {
                      'x x x x x x x x x x x x',
                      'x x x x x x x x x x x x',
                      'x x x x x x x x x x x x',
                      'x x x x x x x x x x x x',
                      'x x x x x x x x x x x x'
                    }}) end"; };
    }
    {
      group = "Qmk";
      event = [ "BufEnter" ];
      pattern = [ "*air40/keymap.c" ];
      callback = { __raw = "function() require('qmk').setup({
                    name = 'LAYOUT_ortho_4x12',
                    layout = {
                      'x x x x x x x x x x x x',
                      'x x x x x x x x x x x x',
                      'x x x x x x x x x x x x',
                      'x x x x x x x x x x x x'
                    }}) end"; };
    }
  ];
}
