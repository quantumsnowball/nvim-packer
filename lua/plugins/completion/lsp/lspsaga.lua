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
        local opts = { silent = true }
        for _, item in pairs({
            -- lsp finder to find the cursor word definition and reference
            { "n", "<leader>fv", require("lspsaga.finder").lsp_finder, opts, 'lspsaga.lsp_finder()' },
            -- show hover doc, and scroll the doc
            { "n", "K", require("lspsaga.hover").render_hover_doc, opts, 'lspsaga.render_hover_doc()' },
            { "n", "<C-d>", function() require("lspsaga.action").smart_scroll_with_saga(1) end, opts, },
            { "n", "<C-u>", function() require("lspsaga.action").smart_scroll_with_saga(-1) end, opts, },
            -- show signature help
            { "n", "gk", require("lspsaga.signaturehelp").signature_help, opts, 'lspsaga.signaturehelp()' },
            { "i", "<C-k>", require("lspsaga.signaturehelp").signature_help, opts, 'lspsaga.signaturehelp()' }
        }) do
            -- unpack values
            -- -- neovim still using lua 5.1, new version use `table.unpack`
            local mode, keys, command, options, hint = unpack(item)
            -- register as vim key maps
            vim.keymap.set(mode, keys, command, options)
            -- register as which-key hints
            if hint then
                require('which-key').register({ [keys] = hint })
            end
        end
    end,
})
