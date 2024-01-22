{
  plugins = {
    luasnip = {
      enable = true;
      extraConfig = {
        enable_autosnippets = false;
        store_selection_keys = "<Tab>";
      };
    };

    nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      preselect = "None";
      matching.disallowPartialFuzzyMatching = false;
      snippet.expand = "luasnip";
      window = {
        completion = {
          scrollbar = false;
          scrolloff = 2;
          border = "rounded";
        };
      };
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "treesitter"; }
        { name = "path"; }
        { name = "fuzzy-path"; }
      ];
      mapping = {
        "<CR>" = {
          action = ''
            cmp.mapping({
              i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                  cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                  fallback()
                end
              end,
              s = cmp.mapping.confirm({ select = true }),
              c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            })
          '';
        };
        "<Tab>" = {
          action = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_locally_jumpable()
              elseif HasWordsBefore() then
                cmp.complete()
              else
                vim.cmd[[silent! lua require("intellitab").indent()]]
                -- fallback()
              end
            end, { "i", "s" })
          '';
        };
      };
    };
  };
}
