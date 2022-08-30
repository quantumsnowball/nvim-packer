local use = require('packer').use


-- LSP installer
-- https://github.com/williamboman/nvim-lsp-installer
use {
    'williamboman/nvim-lsp-installer',
    requires = 'neovim/nvim-lspconfig',
    config = function()
        -- ensure installed
        require('plugins.completion.lsp.installer.utils').ensure_installed()
    end
}
