local use = require('packer').use


-- fzf telescope extension
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    requires = 'quantumsnowball/telescope.nvim',
    config = function()
        local tele = require('telescope')
        tele.load_extension('fzf')
    end
}

-- telescope-ui-select
-- https://github.com/nvim-telescope/telescope-ui-select.nvim
use {
    'nvim-telescope/telescope-ui-select.nvim',
    requires = 'quantumsnowball/telescope.nvim',
    config = function()
        local tele = require('telescope')
        tele.load_extension("ui-select")
    end
}

-- tabman
-- https://github.com/quantumsnowball/telescope-tabman.nvim
use {
    'quantumsnowball/telescope-tabman.nvim',
    branch = 'dev',
    requires = 'quantumsnowball/telescope.nvim',
    config = function()
        local tele = require('telescope')
        local tabman = tele.extensions.tabman.tabman
        -- load extension
        tele.load_extension('tabman')
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
