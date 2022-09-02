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
            border_style = "single", -- "single" | "double" | "rounded" | "bold" | "plus"
            saga_winblend = 10,
            finder_action_keys = {
                vsplit = "v",
                split = "x"
            },
            diagnostic_header = { "😡", "😥", "😤", "😐" },
            code_action_icon = "💡",
        })

        -- keymaps
        local map = require('utils').map
        local opts = { silent = true }
        -- show hover doc, and scroll the doc
        -- map("n", "K", require("lspsaga.hover").render_hover_doc, opts, 'lspsaga.render_hover_doc()')
        map("n", "K", ':Lspsaga hover_doc<cr>', opts, 'lspsaga.render_hover_doc()')
        map("n", "<C-n>", function() require("lspsaga.action").smart_scroll_with_saga(1) end, opts)
        map("n", "<C-p>", function() require("lspsaga.action").smart_scroll_with_saga(-1) end, opts)
        -- show signature help
        -- map("n", "zk", require("lspsaga.signaturehelp").signature_help, opts, 'lspsaga.signaturehelp()')
        -- map("i", "<C-k>", require("lspsaga.signaturehelp").signature_help, opts, 'lspsaga.signaturehelp()')
        -- rename, close rename win use <C-c> in insert mode or `q` in normal mode or `:q`
        map("n", "<leader>rn", ':Lspsaga rename<cr>', opts, 'lspsaga.rename()')
        -- diagnostic and errors
        map("n", "<space>e", require("lspsaga.diagnostic").show_line_diagnostics, opts, 'lspsaga.diagnostic()')
        map("n", "[e", require("lspsaga.diagnostic").goto_prev, opts, 'lspsaga.diagnostic.goto_prev()')
        map("n", "]e", require("lspsaga.diagnostic").goto_next, opts, 'lspsaga.diagnostic.goto_next()')
        map("n", "[E",
            function()
                require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
            end, opts, 'lspsaga.diagnostic.goto_prev(ERROR)')
        map("n", "]E",
            function()
                require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
            end, opts, 'lspsaga.diagnostic.goto_next(ERROR)')
        -- float terminal
        -- map('n', '<leader>tt', require('lspsaga.floaterm').open_float_terminal, opts, 'lspsaga.open_float_terminal()')
    end,
})
