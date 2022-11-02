local use = require('packer').use


-- enable nvim-cmp to use lsp server
-- https://github.com/hrsh7th/cmp-nvim-lsp
use {
    'hrsh7th/cmp-nvim-lsp',
    requires = {
        'hrsh7th/nvim-cmp',
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    },
    config = function()
        local servers = require('plugins.completion.lsp.installer.servers')
        -- ensure installed
        require('plugins.completion.lsp.installer.utils').ensure_installed()
        -- Setup lspconfig.
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        for _, lsp in pairs(servers) do
            -- should only called once on the whole config process
            lspconfig[lsp].setup({
                -- update cmp capabilities
                capabilities = capabilities,
                -- custom individual language server settings
                settings = require('plugins.completion.lsp.installer.configs')(lsp),
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
        'hrsh7th/nvim-cmp',
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
    requires = {
        'hrsh7th/nvim-cmp',
    },
    config = function()
        -- vim.opt.spell = true
        vim.opt.spelllang = { 'en_us' }
    end
}
-- lsp signature (disabled because floating window not dissappeaering in JSX linting)
-- https://github.com/ray-x/lsp_signature.nvim
-- use {
--     'ray-x/lsp_signature.nvim',
--     requires = {
--         'hrsh7th/nvim-cmp',
--     }
--     config = function()
--         require('lsp_signature').setup {
--             bind = true, -- This is mandatory, otherwise border config won't get registered.
--             handler_opts = {
--                 border = 'rounded' -- double, rounded, single, shadow, none
--             },
--             timer_interval = 100, -- default timer check interval set to lower value if you want to reduce latency
--             toggle_key = '<C-k>', -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
--             floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
--             auto_close_after = 5, -- autoclose signature float win after x sec, disabled if nil.
--         }
--     end
-- }
