local use = require('packer').use

use {
    'vim-airline/vim-airline',
    requires = 'vim-airline/vim-airline-themes',
    config = function()
        vim.g.airline_theme = 'soda'
    end
}
