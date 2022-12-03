local use = require('packer').use


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
