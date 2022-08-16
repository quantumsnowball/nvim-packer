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
        require('telescope').load_extension('tele_tabby')
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

-- tele-tabby telescope extension
-- source
-- https://github.com/TC72/telescope-tele-tabby.nvim.git
use {
    'quantumsnowball/telescope-tele-tabby.nvim',
    branch = 'extra',
    config = function()
        local find_tabs = function()
            require('telescope').extensions.tele_tabby.list({
                layout_config = { width = 0.8, height = 0.4 },
            })
        end
        -- keymaps
        require('utils').map('n', 'T', find_tabs, {}, 'telescope.tabpages()')
    end
}

-- better quickfix list
require('plugins.navigation.telescope.bqf')
