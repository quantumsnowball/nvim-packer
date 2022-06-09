local use = require('packer').use

-- file explorer
require('plugins.navigation.explorer')
-- fuzzy search for files
require('plugins.navigation.search')
-- hjkl navigator in vim and tmux windows
use 'christoomey/vim-tmux-navigator'
-- pop up for keymap hints
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      plugins = {
        registers = false -- this window is too big will disrupt workflow
      }
    }
  end
}
-- tab bar
require('plugins.navigation.tabbar')
-- smooth scrolling
-- https://github.com/declancm/cinnamon.nvim
use {
  'declancm/cinnamon.nvim',
  config = function()
    require('cinnamon').setup{
      default_delay = 2
    }
  end
}
-- lazygit version control
--
use {
  'kdheepak/lazygit.nvim',
  config = function()
    -- toggle keymap
    vim.keymap.set('n', '<leader>g', ':LazyGit<CR>')
  end
}
-- git fugitive
use 'tpope/vim-fugitive'
-- toggle terminal
-- https://github.com/akinsho/toggleterm.nvim
use {
  'akinsho/toggleterm.nvim',
  tag = 'v1.*',
  config = function()
    require("toggleterm").setup{
      open_mapping = '<leader>t',
      direction = 'float',
      float_opts = {
        border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' |
      }
    }
  end
}
