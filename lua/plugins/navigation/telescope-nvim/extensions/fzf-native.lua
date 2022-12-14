local use = require('packer').use


-- fzf telescope extension
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    requires = 'nvim-telescop/telescope.nvim',
    config = function()
        local tele = require('telescope')
        tele.load_extension('fzf')
    end
}
