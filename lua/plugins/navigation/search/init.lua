local use = require('packer').use

use {
  'nvim-telescope/telescope.nvim',
  requires = {'nvim-lua/plenary.nvim'},
  config = function()
    require('telescope').setup{
      defaults = {
        layout_config = { vertical = { width = 0.8 } }
      }
    }
    -- telescope keymaps
    require('plugins.navigation.search.telescope-keymaps')
  end
}
