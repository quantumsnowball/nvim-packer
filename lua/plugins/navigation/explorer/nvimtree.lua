local use = require('packer').use

--
use {
  'kyazdani42/nvim-tree.lua', tag = 'nightly',
  requires = {'kyazdani42/nvim-web-devicons'},
  config = function()
    require('nvim-tree').setup {
      reload_on_bufenter = true,
      view = {
        width = 25,
        adaptive_size = true
      },
      renderer = { highlight_opened_files = 'all' },
      git = { ignore = false }
    }
    -- toggle keymap
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
  end
}
