local use = require('packer').use


-- indentation line guides
-- https://github.com/lukas-reineke/indent-blankline.nvim
use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        -- show space and end-of-line
        vim.opt.listchars:append("space:⋅")
        vim.opt.listchars:append("eol:↴")
        -- toggle space and eol chars
        vim.opt.list = false
        require('utils').map('n', '<F6>', ':set list!<CR>')
        -- setup
        require("indent_blankline").setup {
            show_end_of_line = true,
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
        }
        -- wrapped lines follow indentation
        vim.opt.breakindent = true
    end
}
