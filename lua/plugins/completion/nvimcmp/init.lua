local use = require('packer').use

-- completion engine written in lua
-- https://github.com/hrsh7th/nvim-cmp
use {
    'hrsh7th/nvim-cmp',
    requires = {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'f3fora/cmp-spell',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-calc',
    },
    config = function()
        local configs = require('plugins.completion.nvimcmp.configs')
        require('cmp').setup(configs)
    end
}

-- load nvimcmp extensions
require('plugins.completion.nvimcmp.extensions')
