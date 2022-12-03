local use = require('packer').use


-- hjkl navigator in vim and tmux windows
-- https://github.com/christoomey/vim-tmux-navigator
use {
    'christoomey/vim-tmux-navigator',
    config = function()
        local map = require('utils').map
        local opts = { silent = true }
        -- enable ctrl + hjkl only in normal mode
        vim.g.tmux_navigator_no_mappings = 1
        map('n', '<C-k>', ':TmuxNavigateUp<cr>', opts)
        map('n', '<C-j>', ':TmuxNavigateDown<cr>', opts)
        map('n', '<C-h>', ':TmuxNavigateLeft<cr>', opts)
        map('n', '<C-l>', ':TmuxNavigateRight<cr>', opts)
    end
}
