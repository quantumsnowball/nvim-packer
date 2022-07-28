local use = require('packer').use

-- airline
-- https://github.com/vim-airline/vim-airline
use {
    'vim-airline/vim-airline',
    requires = 'vim-airline/vim-airline-themes',
    config = function()
        vim.g.airline_theme = 'soda'
    end
}
