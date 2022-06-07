return function (cmp, luasnip)
  return {
    -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<PageUp>"] = cmp.mapping.scroll_docs(-4),
    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<PageDown>"] = cmp.mapping.scroll_docs(4),
    ["<C-P>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping { i = cmp.mapping.confirm { select = true }, },
    ["<Right>"] = cmp.mapping { i = cmp.mapping.confirm { select = true }, },
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { "i" }),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { "i" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expandable() then luasnip.expand()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fallback()
      end
    end, { "i", "s", }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then luasnip.jump(-1)
      else fallback()
      end
    end, { "i", "s", }),
  }
end
