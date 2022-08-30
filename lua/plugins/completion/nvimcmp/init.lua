local use = require('packer').use

-- completion engine written in lua
-- https://github.com/hrsh7th/nvim-cmp
use {
    'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'f3fora/cmp-spell',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            view = { entries = { name = 'custom', selection_order = 'near_cursor' } },
            experimental = { ghost_text = false, },
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, vim_item)
                    local kind_icons = require('plugins.completion.nvimcmp.kind_icons')
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                    vim_item.menu = (require('plugins.completion.nvimcmp.menu_items'))[entry.source.name]
                    return vim_item
                end
            },
            mapping = require('plugins.completion.nvimcmp.keymaps')(cmp, luasnip),
            sources = {
                { name = 'nvim_lsp' },
                { name = "buffer" },
                { name = 'luasnip' },
                { name = "path" },
                { name = "spell" },
            },
        })

    end
}

-- load nvimcmp extensions
require('plugins.completion.nvimcmp.extensions')
