local use = require('packer').use


-- tabman
-- https://github.com/quantumsnowball/telescope-tabman.nvim
use {
    'quantumsnowball/telescope-tabman.nvim',
    branch = 'dev',
    requires = 'nvim-telescope/telescope.nvim',
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
