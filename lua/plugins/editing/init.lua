local use = require('packer').use

-- some common editing related shortcuts
-- shift-tab will go one tab backward
vim.keymap.set('i', '<S-Tab>', '<C-d>')
-- | and \ will break line before and after cursor
vim.keymap.set('n', '|', 'i<C-m><esc>')
vim.keymap.set('n', '\\', 'a<C-m><esc>')

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
-- show git changes
-- https://github.com/lewis6991/gitsigns.nvim
use {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
        -- show line number
        vim.opt.number = true
        -- always include sign column to fix gutter width
        vim.opt.signcolumn = 'yes'
        -- highlight current line and column
        vim.opt.cursorline = true
        -- add margins when scrolling with curosr
        vim.opt.scrolloff = 8
    end
}
