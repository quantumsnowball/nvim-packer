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
-- enable nvim-cmp to use lsp server
-- https://github.com/hrsh7th/cmp-nvim-lsp
use {
    'hrsh7th/cmp-nvim-lsp',
    requires = 'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require('lspconfig')
        local servers = require('plugins.completion.lsp.servers.names')
        -- Setup lspconfig.
        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        for _, lsp in pairs(servers) do
            -- should only called once on the whole config process
            lspconfig[lsp].setup({
                -- update cmp capabilities
                capabilities = capabilities,
                -- custom individual language server settings
                settings = require('plugins.completion.lsp.servers.settings')(lsp),
                -- lsp related keymaps
                on_attach = require('plugins.completion.lsp.keymaps')
            })
        end
    end
}
-- luasnip snippet engine
-- https://github.com/L3MON4D3/LuaSnip
use {
    'L3MON4D3/LuaSnip',
    requires = {
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets'
    },
    config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
    end
}
-- spell checking server
-- https://github.com/f3fora/cmp-spell
use {
    'f3fora/cmp-spell',
    config = function()
        vim.opt.spell = true
        vim.opt.spelllang = { 'en_us' }
    end
}
-- lsp signature
-- https://github.com/ray-x/lsp_signature.nvim
use {
    'ray-x/lsp_signature.nvim',
    config = function()
        require('lsp_signature').setup {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = 'rounded' -- double, rounded, single, shadow, none
            },
            timer_interval = 100, -- default timer check interval set to lower value if you want to reduce latency
            toggle_key = '<C-k>', -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
            floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
            auto_close_after = 5, -- autoclose signature float win after x sec, disabled if nil.
        }
    end
}
