local use = require('packer').use


-- sudo write files with permission
-- https://github.com/lambdalisue/suda.vim
use 'lambdalisue/suda.vim'
-- preview markdown
-- https://github.com/iamcco/markdown-preview.nvim
use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
        vim.g.mkdp_theme = 'dark'
        -- keymaps
        local map = require('utils').map
        map('n', '<leader>pm', ':MarkdownPreviewToggle<cr>')
    end
}
