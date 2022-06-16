local use = require('packer').use

-- some common editing related shortcuts
-- shift-tab will go one tab backward
vim.keymap.set('i', '<S-Tab>', '<C-d>')
-- | and \ will break line before and after cursor
vim.keymap.set('n', '|', 'i<C-m><esc>')
vim.keymap.set('n', '\\', 'a<C-m><esc>')
-- go and gO will open new line but stay in normal mode
vim.keymap.set('n', 'gO', 'O<esc>')
vim.keymap.set('n', 'go', 'o<esc>')

-- easy multiple line jumping
use 'easymotion/vim-easymotion'
-- easy shortcuts to change surrounds
use 'tpope/vim-surround'
-- expand * select-all function to visual mode selection
use 'thinca/vim-visualstar'
-- auto pairing brackets
use {
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup {}
    end
}
-- toggle comment line
-- https://github.com/numToStr/Comment.nvim
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup {}
        -- remap <leader>/ to line comment toggle
        vim.cmd 'nmap <leader>/ gcc'
    end
}
-- version control
require('plugins.editing.versioning')
