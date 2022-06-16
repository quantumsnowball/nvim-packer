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
            -- put default settings for file types here
        }
    end
}
-- indentation
require('plugins.highlight.indentation')
-- display color code on background
-- https://github.com/norcalli/nvim-colorizer.lua
use {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup {
            '*'; -- Highlight all files, but customize some others.
            css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
            html = { names = false; } -- Disable parsing "names" like Blue or Gray
        }
    end
}
-- colorize bracket pairsk
-- https://github.com/p00f/nvim-ts-rainbow.git
use {
    'p00f/nvim-ts-rainbow',
    config = function()
        require("nvim-treesitter.configs").setup {
            highlight = {},
            rainbow = {
                enable = true,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
            }
        }
    end
}
