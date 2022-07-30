local use = require('packer').use

-- session manager
require('plugins.navigation.session')
-- file explorer
require('plugins.navigation.explorer')
-- fuzzy search for files
require('plugins.navigation.telescope')
-- hjkl navigator in vim and tmux windows
-- https://github.com/christoomey/vim-tmux-navigator
use 'christoomey/vim-tmux-navigator'
-- pop up for keymap hints
-- https://github.com/folke/which-key.nvim
use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
            plugins = {
                marks = false,
                registers = false,
                presets = {
                    q = true
                },
            },
            window = {
                border = 'double',
                winblend = 20,
            },
            layout = {
                height = { min = 4, max = 10 },
                align = 'center'
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
};
-- show buffer path at top right corner
-- https://github.com/b0o/incline.nvim
use {
    'b0o/incline.nvim',
    config = function()
        -- define its own highligh group
        -- vim.cmd [[ autocmd VimEnter,ColorScheme * hi Incline guifg=#dfff00 guibg=#444444 ]]
        vim.cmd [[ autocmd VimEnter,ColorScheme * hi Incline guifg=#deff00 guibg=#555555 gui=bold ]]
        -- config
        require('incline').setup({
            highlight = {
                groups = {
                    InclineNormal = {
                        default = true,
                        group = "Incline"
                    },
                    InclineNormalNC = {
                        default = true,
                        group = "Incline"
                    }
                }
            },
            -- output formatting function
            render = function()
                -- reference :help filename-modifiers
                -- relative path from cwd
                return vim.fn.expand('%:.')
            end
        })
    end
}
