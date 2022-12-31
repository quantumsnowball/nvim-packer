local use = require('packer').use

-- nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua
use {
    'kyazdani42/nvim-tree.lua', tag = 'nightly',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
        require('nvim-tree').setup {
            actions = {
                change_dir = {
                    enable = false,
                },
            },
            reload_on_bufenter = true,
            update_focused_file = {
                enable = true,
            },
            view = {
                float = {
                    enable = true,
                    open_win_config = {
                        height = 1000,
                    }
                },
                adaptive_size = true,
                mappings = {
                    list = {
                        { key = "<esc>", action = "close" }
                    }
                }
            },
            renderer = { highlight_opened_files = 'all' },
            -- default hide dotfiles and ignored files
            -- simply type H I to toggle show
            filters = { dotfiles = true },
            git = { ignore = true }
        }
        -- toggle keymap
        require('utils').map('n', '<leader>e', ':NvimTreeToggle .<CR>', { silent = true })
    end
}
