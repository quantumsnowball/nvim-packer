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
require('plugins.completion.lsp.installer')

-- LSP enhanced - lspsaga
require('plugins.completion.lsp.extensions')

-----------
-- Debug --
-----------
-- try to force FileType autocmd on these events, avoiding the lsp cmd not found startup bug
vim.cmd('autocmd VimEnter,BufEnter * doautocmd FileType')
