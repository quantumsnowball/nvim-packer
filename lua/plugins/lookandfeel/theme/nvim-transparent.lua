local use = require('packer').use


-- enable transparent for all theme
-- https://github.com/xiyaowong/nvim-transparent
use {
    'xiyaowong/nvim-transparent',
    config = function()
        require("transparent").setup({
            enable = true, -- boolean: enable transparent
            extra_groups = { -- table/string: additional groups that should be cleared
                -- In particular, when you set it to 'all', that means all available groups

                -- example of akinsho/nvim-bufferline.lua
                "BufferLineTabClose",
                "BufferlineBufferSelected",
                "BufferLineFill",
                "BufferLineBackground",
                "BufferLineSeparator",
                "BufferLineIndicatorSelected",
            },
            exclude = {
                "MatchParen"
            }, -- table: groups you don't want to clear
        })
        -- custom key bindings
        local map = require('utils').map
        -- avaiable commands:
        --   :TransparentEnable
        --   :TransparentDisable
        --   :TransparentToggle
        map('n', '<M-u>', ':TransparentToggle<cr>')
        map('n', '<F4>', ':TransparentToggle<cr>')
    end

}
