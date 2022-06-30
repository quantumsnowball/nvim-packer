local use = require('packer').use

-- syntax highlighting
-- https://github.com/nvim-treesitter/nvim-treesitter
use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = 'all',
            ignore_install = { "phpdoc" }, -- can never download successfully on macos
            highlight = { enable = true },
            incremental_selection = { enable = true },
            textobjects = { enable = true },
            indent = { enable = false }
        }
        -- enable code folding
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        vim.opt.foldlevel = 10
    end
}
-- lazy detect file type
-- https://github.com/nathom/filetype.nvim
use {
    'nathom/filetype.nvim',
    config = function()
        require('filetype').setup {
            overrides = {
                -- put default settings for file types here
                -- match filename using Lua regex
                extensions = {
                    ["local"] = "conf"
                }
            }
        }
    end
}
-- indentation
require('plugins.highlight.indentation')
-- pairing
require('plugins.highlight.pairing')
