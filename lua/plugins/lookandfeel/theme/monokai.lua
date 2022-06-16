local use = require('packer').use

-- colorful editor theme
-- https://github.com/tanvirtin/monokai.nvim
use {
    'tanvirtin/monokai.nvim',
    config = function()
        vim.cmd 'colorscheme monokai_ristretto'
    end
}
