local use = require('packer').use

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
