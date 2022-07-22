local use = require('packer').use


-- lspsaga
-- https://github.com/glepnir/lspsaga.nvim
use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")
        -- configs
        saga.init_lsp_saga({
            -- your configuration
        })
        -- keymaps
    end,
})
