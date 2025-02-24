{ config, lib, utils, ... }:

let
  mkSources = sources: map (source:
    if lib.isAttrs source then
      source
    else
      { name = source; }
  ) sources;

in {
  options.modules.cmp.enable = lib.mkEnableOption "cmp";

  config = lib.mkIf config.modules.cmp.enable {
    plugins = {
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = false;
          store_selection_keys = "<Tab>";
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          view = {
            # docs.auto_open = false;
            entries =
            {
              name = "custom";
              selection_order = "near_cursor";
            };
            preselect = "None";
            performance.max_view_entries = 5;
            matching.disallowPartialFuzzyMatching = false;
            snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
            window = {
              completion = {
                scrollbar = false;
                scrolloff = 2;
                border = "rounded";
              };
            };
            sources = mkSources [
              "nvim_lsp"
              "luasnip"
              "treesitter"
              "path"
              "fuzzy-path"
            ];
            mapping = {
              "<CR>" = "cmp.mapping.confirm({ select = false })";
              "<Tab>" = ''
                cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_locally_jumpable()
                  elseif HasWordsBefore() then
                    cmp.complete()
                  else
                    ${if config.plugins.intellitab.enable then
                     "vim.cmd[[silent! lua require('intellitab').indent()]]"
                    else
                     "fallback()"
                   }
                  end
                end, { "i", "s" })
              '';
              "<S-Tab>" = ''
                cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
                end, { "i", "s" })
              '';
            };
          };
        };
      };
    };
  };
}
