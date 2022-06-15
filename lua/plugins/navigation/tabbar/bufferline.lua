local use = require('packer').use

-- buffer tabs
-- https://github.com/akinsho/bufferline.nvim
use {
    'akinsho/bufferline.nvim', tag = "v2.*",
    requires = {
        'kyazdani42/nvim-web-devicons',
        'moll/vim-bbye'
    },
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup {
            options = {
                offsets = { { filetype = "NvimTree", text = "NvimTree", text_align = "left" } },
                show_close_icons = false
            }
        }
        -- close buffer key-bindings
        -- needs vim-bbye plugins
        vim.keymap.set('n', '<M-w>', ':Bdelete<CR>')
        vim.keymap.set('n', '<space>x', ':Bdelete<CR>')
    end
}
