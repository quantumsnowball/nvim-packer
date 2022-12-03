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
