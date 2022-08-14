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
        require('utils').map('n', '<F5>', ':set list!<CR>')
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
-- smart detect document indentation
-- https://github.com/tpope/vim-sleuth
use {
    'tpope/vim-sleuth',
    config = function()
        -- default neovim tabsize to 4 space
        vim.opt.tabstop = 4
        -- shift width match with tabstop
        vim.opt.shiftwidth = 4
        -- use space instead of tab char
        vim.opt.expandtab = true
    end
}
