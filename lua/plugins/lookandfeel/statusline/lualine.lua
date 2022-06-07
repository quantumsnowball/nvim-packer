local use = require('packer').use

-- https://github.com/nvim-lualine/lualine.nvim
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup{
      options = {
        -- Gallery
        -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        theme = 'powerline_dark'
      },
      sections = {
        -- the 3rd left component on the status bar
        lualine_c = { { 'filename', path = 1 } }
      }
    }
    -- disable the original mode indicator
    vim.opt.showmode = false
  end
}
