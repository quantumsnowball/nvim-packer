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
        require('telescope').setup {
            defaults = {
                layout_strategy = 'vertical',
                layout_config = {
                    vertical = {
                        width = 0.85,
                        preview_height = 0.65
                    }
                },
                mappings = {
                    n = {
                        o = 'toggle_all',
                        p = require('telescope.actions.layout').toggle_preview,
                        J = require('telescope.actions').cycle_history_next,
                        K = require('telescope.actions').cycle_history_prev,
                    },
                    i = {
                        ["<C-j>"] = require('telescope.actions').cycle_history_next,
                        ["<C-k>"] = require('telescope.actions').cycle_history_prev,
                        ["<Down>"] = require('telescope.actions').cycle_history_next,
                        ["<Up>"] = require('telescope.actions').cycle_history_prev,
                    },
                },
                sorting_strategy = 'ascending',
                scroll_strategy = 'limit',
                initial_mode = 'normal',
                border = true,
                dynamic_preview_title = true,
                prompt_prefix = '🔍 '
            },
            pickers = {
                find_files = { initial_mode = 'insert', },
                live_grep = { initial_mode = 'insert' },
                jumplist = { show_line = false },
                help_tags = { initial_mode = 'insert' },
                buffers = {
                    layout_config = { width = 0.6, height = 0.7, preview_height = 0.35, },
                    mappings = { n = { x = "delete_buffer" } },
                },
                current_buffer_fuzzy_find = { initial_mode = 'insert' },
                registers = { initial_mode = 'insert' },
                builtin = { layout_config = { preview_height = 0.4 } },
                colorscheme = { layout_config = { width = 0.2, height = 0.7 } },
                spell_suggest = { layout_config = { width = 0.2, height = 0.7 } },
                command_history = { layout_config = { width = 0.6 } },
                highlights = { layout_config = { width = 0.7 } },
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        border = true
                    }),
                }
            },
        }
        require('telescope').load_extension('fzf')
        require("telescope").load_extension("ui-select")
        -- telescope keymaps
        local keymaps = require('plugins.navigation.telescope.keymaps').keymaps
        for _, item in pairs(keymaps) do
            local mode, keys, command, options, hint = unpack(item)
            require('utils').map(mode, keys, command, options, hint)
        end
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
