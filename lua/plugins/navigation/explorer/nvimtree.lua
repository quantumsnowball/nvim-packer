local use = require('packer').use

-- nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua
use {
    'kyazdani42/nvim-tree.lua', tag = 'nightly',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
        require('nvim-tree').setup {
            reload_on_bufenter = true,
            view = {
                width = 25,
                adaptive_size = true
            },
            renderer = { highlight_opened_files = 'all' },
            -- default hide dotfiles and ignored files
            -- simply type H I to toggle show
            filters = { dotfiles = true },
            git = { ignore = true }
        }
        -- toggle keymap
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
    end
}
