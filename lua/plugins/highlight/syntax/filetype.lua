local use = require('packer').use


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
