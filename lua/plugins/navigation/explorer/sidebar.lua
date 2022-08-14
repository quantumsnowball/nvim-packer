local use = require('packer').use

-- sidebar
-- https://github.com/sidebar-nvim/sidebar.nvim
use {
    'sidebar-nvim/sidebar.nvim',
    config = function()
        require('sidebar-nvim').setup {
            initial_width = 30,
            update_interval = 200,
            section_separator = { '', '', '' },
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
        require('utils').map('n', '<leader>e', ':SidebarNvimFocus<CR>')
    end
}
