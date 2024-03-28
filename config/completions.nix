{
  plugins = {
    luasnip = {
      enable = true;
      extraConfig = {
        enable_autosnippets = false;
        store_selection_keys = "<Tab>";
      };
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        preselect = "None";
        matching.disallowPartialFuzzyMatching = false;
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
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
          "<CR>" = ''
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
          "<Tab>" = ''
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
