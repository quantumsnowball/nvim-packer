local use = require('packer').use

-- telescope
-- https://github.com/nvim-telescope/telescope.nvim
use {
    'quantumsnowball/telescope.nvim',
    branch = 'builtin-tabpages',
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

-- tabman
-- https://github.com/quantumsnowball/telescope-tabman.nvim
use {
    'quantumsnowball/telescope-tabman.nvim',
    branch = 'dev',
    config = function()
        local t = require('telescope')
        t.load_extension('tabman')
        local tabman = t.extensions.tabman.tabman
        -- configs
        local layout_config = { width = 0.7, preview_height = 0.5, }
        -- keymaps
        require('utils').map('n', '<leader>t', function()
            tabman({ layout_config = layout_config })
        end, {}, 'telescope.tabpages()')
        require('utils').map('n', '<leader>ft', function()
            tabman({ layout_config = layout_config, initial_mode = 'insert' })
        end, {}, 'telescope.tabpages()')
    end
}

-- better quickfix list
require('plugins.navigation.telescope.bqf')
