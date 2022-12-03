local use = require('packer').use


-- display color code on background
-- https://github.com/norcalli/nvim-colorizer.lua
use {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup {
            '*'
        }
    end
}
