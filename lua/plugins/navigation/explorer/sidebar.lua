local use = require('packer').use

use {
  'sidebar-nvim/sidebar.nvim',
  config = function()
    require('sidebar-nvim').setup{
      initial_width = 30,
      update_interval = 200,
      section_separator = {'', '', ''},
      sections = {
        'buffers',
        'files'
      },
      buffers = {
        icon = '',
        sorting = 'name',
        show_numbers = false
      }
    }
    -- toggle keymap
    vim.keymap.set('n', '<leader>e', ':SidebarNvimFocus<CR>')
  end
}
