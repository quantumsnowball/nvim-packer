local use = require('packer').use

-- moving selecting text
require('plugins.editing.text.moving')

-- easy shortcuts to change surrounds
-- https://github.com/kylechui/nvim-surround
use {
    'kylechui/nvim-surround',
    config = function()
        require('nvim-surround').setup {
            -- Configuration here, or leave empty to use defaults
        }
    end
}
-- expand * select-all function to visual mode selection
-- https://github.com/thinca/vim-visualstar
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
