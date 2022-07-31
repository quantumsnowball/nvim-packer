local use = require('packer').use


-- LSP support for neovim
-- https://github.com/neovim/nvim-lspconfig
use {
    'neovim/nvim-lspconfig',
    config = function()
        -- auto format document on save
        vim.cmd('autocmd BufWritePre * silent! lua vim.lsp.buf.format({async=false})')
    end
}
-- LSP installer
-- https://github.com/williamboman/nvim-lsp-installer
use {
    'williamboman/nvim-lsp-installer',
    requires = 'neovim/nvim-lspconfig',
    config = function()
        local servers = require('plugins.completion.lsp.servers.names')
        -- ensure installed
        require("nvim-lsp-installer").setup {
            ensure_installed = servers,
            automatic_installation = true,
        }
    end
}
-- LSP enhanced - lspsaga
require('plugins.completion.lsp.lspsaga')

-----------
-- Debug --
-----------
-- try to force FileType autocmd on these events, avoiding the lsp cmd not found startup bug
vim.cmd('autocmd VimEnter,BufEnter * doautocmd FileType')
