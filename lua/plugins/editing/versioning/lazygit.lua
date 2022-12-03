local use = require('packer').use


-- lazygit version control
-- https://github.com/kdheepak/lazygit.nvim
use {
    'kdheepak/lazygit.nvim',
    config = function()
        -- config
        -- vim.g.lazygit_floating_window_winblend = 30
        vim.g.lazygit_floating_window_scaling_factor = 1.0
        -- toggle keymap
        local map = require('utils').map
        map('n', '<leader>gg', ':LazyGit<CR>')
        map('n', '<leader>gl', ':LazyGit<CR>')
    end
}
