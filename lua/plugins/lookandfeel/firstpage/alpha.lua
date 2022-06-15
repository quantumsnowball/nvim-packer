local use = require('packer').use

-- https://github.com/goolord/alpha-nvim
use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
        -- require('alpha').setup(require'alpha.themes.startify'.config)
        require('alpha').setup(require 'alpha.themes.dashboard'.config)
    end
}
