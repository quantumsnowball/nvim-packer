local use = require('packer').use

-- buffer tabs
-- https://github.com/akinsho/bufferline.nvim
use {
    'akinsho/bufferline.nvim', tag = "v2.*",
    requires = {
        'kyazdani42/nvim-web-devicons'
    },
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup {
            options = {
                offsets = { { filetype = "NvimTree", text = "NvimTree", text_align = "left" } },
                show_close_icons = false
            }
        }
    end
}
