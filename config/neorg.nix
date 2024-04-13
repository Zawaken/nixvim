{
  keymaps = [
    {
      key = "<leader>i";
      action = "<CMD>Neorg index<CR>";
    }
  ];
  plugins.neorg = {
    enable = true;
    modules = {
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
}
