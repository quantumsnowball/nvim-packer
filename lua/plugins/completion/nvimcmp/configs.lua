local cmp = require('cmp')
local luasnip = require('luasnip')

local menu_items = {
    nvim_lsp_signature_help = "[Signature Help]",
    nvim_lsp = "[LSP]",
    luasnip = "[LuaSnip]",
    buffer = "[Buffer]",
    path = "[Path]",
    spell = "[Spell]",
}

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

return {
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
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = menu_items[entry.source.name]
            return vim_item
        end
    },
    mapping = require('plugins.completion.nvimcmp.keymaps')(cmp, luasnip),
    sources = {
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        { name = "buffer" },
        { name = 'luasnip' },
        { name = "path" },
        { name = "spell" },
    },
}
