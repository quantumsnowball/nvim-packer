local use = require('packer').use

-- telescope
-- https://github.com/nvim-telescope/telescope.nvim
use {
    'nvim-telescope/telescope.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        -- configs
        local core_cf = require('plugins.navigation.telescope-nvim.configs')
        local ext_cf = require('plugins.navigation.telescope-nvim.extensions.configs')
        local configs = vim.tbl_extend('error', core_cf, ext_cf)
        -- print(vim.inspect(configs))
        require('telescope').setup(configs)
        -- telescope keymaps
        require('plugins.navigation.telescope-nvim.keymaps')
        -- extensions
        require('plugins.navigation.telescope-nvim.extensions')
    end
}

-- better quickfix list
require('plugins.navigation.telescope-nvim.bqf')
