local use = require('packer').use


-- smooth scrolling
-- https://github.com/declancm/cinnamon.nvim
use {
    'declancm/cinnamon.nvim',
    config = function()
        require('cinnamon').setup {
            default_delay = 2
        }
    end
}
