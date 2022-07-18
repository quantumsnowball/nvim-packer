local use = require('packer').use

-- diagnostics
require('plugins.editing.diagnostics')
-- jumping
require('plugins.editing.jumping')
-- easy shortcuts to change surrounds
use 'tpope/vim-surround'
-- expand * select-all function to visual mode selection
use 'thinca/vim-visualstar'
-- auto pairing brackets
-- https://github.com/windwp/nvim-autopairs
use {
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup {
            disable_in_visualblock = true
        }
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
-- sudo write files with permission
-- https://github.com/lambdalisue/suda.vim
use 'lambdalisue/suda.vim'
