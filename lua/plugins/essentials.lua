local use = require('packer').use


-- pop up for keymap hints
-- https://github.com/folke/which-key.nvim
use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
            plugins = {
                marks = false,
                registers = false,
                presets = {
                    q = true
                },
            },
            window = {
                border = 'double',
                winblend = 20,
            },
            layout = {
                height = { min = 4, max = 10 },
                align = 'center'
            }
        }
    end
}
