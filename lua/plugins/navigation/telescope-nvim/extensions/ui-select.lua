local use = require('packer').use


-- telescope-ui-select
-- https://github.com/nvim-telescope/telescope-ui-select.nvim
use {
    'nvim-telescope/telescope-ui-select.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    config = function()
        local tele = require('telescope')
        tele.load_extension("ui-select")
    end
}
