local use = require('packer').use

-- session manager
require('plugins.navigation.session')
-- file explorer
require('plugins.navigation.explorer')
-- fuzzy search for files
require('plugins.navigation.telescope')
-- hjkl navigator in vim and tmux windows
use 'christoomey/vim-tmux-navigator'
-- pop up for keymap hints
use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
            plugins = {
                -- registers = false -- this window is too big will disrupt workflow
            }
        }
    end
}
-- tab bar
require('plugins.navigation.tabbar')
-- smooth scrolling
-- https://github.com/declancm/cinnamon.nvim
use {
    'declancm/cinnamon.nvim',
    config = function()
        require('cinnamon').setup {
            default_delay = 2
        }
    end
}
-- toggle terminal
-- https://github.com/akinsho/toggleterm.nvim
use {
    'akinsho/toggleterm.nvim',
    tag = 'v1.*',
    config = function()
        require("toggleterm").setup {
            open_mapping = '<leader>t',
            insert_mappings = false,
            direction = 'float',
            float_opts = {
                border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' |
            }
        }
    end
}
-- outline
-- https://github.com/simrat39/symbols-outline.nvim
use {
    'simrat39/symbols-outline.nvim',
    config = function()
        vim.keymap.set('n', '<leader>o', ':SymbolsOutline<cr>')
        vim.keymap.set('n', '<leader>m', ':SymbolsOutline<cr>')
        -- override defaults
        vim.g.symbols_outline = {
            preview_bg_highlight = 'Pmenu',
            winblend = 30,
            auto_preview = false,
            keymaps = {
                focus_location = { "o", "H" },
                hover_symbol = "K",
                toggle_preview = { "J", "<Tab>" },
            }
        }
    end
}
