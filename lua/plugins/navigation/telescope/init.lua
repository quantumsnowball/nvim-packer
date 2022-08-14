local use = require('packer').use

-- telescope
-- https://github.com/nvim-telescope/telescope.nvim
use {
    'nvim-telescope/telescope.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
        'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function()
        -- configs
        local configs = require('plugins.navigation.telescope.configs')
        require('telescope').setup(configs)
        -- load extensions
        require('telescope').load_extension('fzf')
        require("telescope").load_extension("ui-select")
        -- telescope keymaps
        require('plugins.navigation.telescope.keymaps')
    end
}

-- fzf telescope extension
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
}

-- better quickfix list
require('plugins.navigation.telescope.bqf')
