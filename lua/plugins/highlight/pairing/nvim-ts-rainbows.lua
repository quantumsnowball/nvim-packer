local use = require('packer').use


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
                extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
            }
        }
    end
}
