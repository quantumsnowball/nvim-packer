local use = require('packer').use

-- telescope
-- https://github.com/nvim-telescope/telescope.nvim
use {
    'nvim-telescope/telescope.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
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
                        p = require('telescope.actions.layout').toggle_preview
                    }
                },
                scroll_strategy = 'limit',
                winblend = 10,
                initial_mode = 'normal',
                border = true,
                dynamic_preview_title = true,
            },
            pickers = {
                find_files = {
                    initial_mode = 'insert',
                    -- find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
                },
                live_grep = { initial_mode = 'insert' },
                help_tags = { initial_mode = 'insert' },
                buffers = {
                    layout_config = {
                        width = 0.6,
                        height = 0.7,
                        preview_height = 0.35,
                        prompt_position = "bottom",
                    },
                    mappings = {
                        n = {
                            x = "delete_buffer"
                        }
                    }
                },
                current_buffer_fuzzy_find = { initial_mode = 'insert' },
                registers = { initial_mode = 'insert' },
                builtin = { layout_config = { preview_height = 0.4 } },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        border = true
                    }),
                }
            },
        }
        require("telescope").load_extension("ui-select")
        -- telescope keymaps
        local keymaps = require('plugins.navigation.telescope.keymaps').keymaps
        for _, item in pairs(keymaps) do
            local mode, keys, command, options, hint = unpack(item)
            require('utils').map(mode, keys, command, options, hint)
        end
    end
}

-- better quickfix list
require('plugins.navigation.telescope.bqf')
