local use = require('packer').use


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
