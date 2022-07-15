local use = require('packer').use

use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup {
            defaults = {
                layout_config = { vertical = { width = 0.8 } }
            },
            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
                },
            }
        }
        -- telescope keymaps
        local keymaps = require('plugins.navigation.telescope.keymaps')
        for _, item in pairs(keymaps) do
            -- unpack values
            -- -- neovim still using lua 5.1, new version use `table.unpack`
            local hint, mode, keys, command = unpack(item)
            -- register as vim key maps
            vim.keymap.set(mode, keys, command)
            -- register as which-key hints
            require('which-key').register({ [keys] = hint })
        end
    end
}

-- better quickfix list
require('plugins.navigation.telescope.bqf')
