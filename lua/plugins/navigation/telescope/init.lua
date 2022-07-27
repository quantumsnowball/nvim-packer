local use = require('packer').use

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
                scroll_strategy = 'limit',
                winblend = 10,
                initial_mode = 'normal',
                border = true,
            },
            pickers = {
                find_files = {
                    initial_mode = 'insert',
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
                },
                live_grep = { initial_mode = 'insert' },
                help_tags = { initial_mode = 'insert' },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        border = false
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
