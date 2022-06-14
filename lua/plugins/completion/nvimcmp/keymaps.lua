return function (cmp, luasnip)
  return {
    -- scrolling
    ["<PageUp>"] = cmp.mapping.scroll_docs(-4),
    ["<PageDown>"] = cmp.mapping.scroll_docs(4),
    -- toggle
    ["<C-p>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.abort()
      else cmp.complete()
      end
    end, { "i", "s" }
    ),
    -- confirm
    ["<CR>"] = cmp.mapping { i = cmp.mapping.confirm { select = true }, },
    -- navigate
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { "i" }),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { "i" }),
    -- navigate and jumping fields
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else fallback()
      end
    end, { "i", "s", }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else fallback()
      end
    end, { "i", "s", }),
  }
end
