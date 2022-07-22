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
        -- lsp finder to find the cursor word definition and reference
        vim.keymap.set("n", "<leader>fs", require("lspsaga.finder").lsp_finder, { silent = true, noremap = true })
        -- show hover doc, and scroll the doc
        vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc, { silent = true })
        vim.keymap.set("n", "<C-d>", function() require("lspsaga.action").smart_scroll_with_saga(1) end,
            { silent = true })
        vim.keymap.set("n", "<C-u>", function() require("lspsaga.action").smart_scroll_with_saga(-1) end,
            { silent = true })
    end,
})
