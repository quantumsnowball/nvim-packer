local use = require('packer').use


-- git fugitive
-- https://github.com/tpope/vim-fugitive
use {
    'tpope/vim-fugitive',
    config = function()
        require('utils').map('n', '<leader>Gd', ':Gvdiff<cr>', {}, 'telescope.diagnostics()')
    end
}
