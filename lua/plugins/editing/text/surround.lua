local use = require('packer').use

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
