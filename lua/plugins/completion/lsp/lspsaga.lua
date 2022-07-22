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
            saga_winblend = 30,
            diagnostic_header = { "😡", "😥", "😤", "😐" },
            code_action_icon = "💡",
        })

        -- keymaps
        local opts = { silent = true }
        for _, item in pairs({
            -- lsp finder to find the cursor word definition and reference
            { "n", "<leader>fv", require("lspsaga.finder").lsp_finder, opts, 'lspsaga.lsp_finder()' },
            -- show hover doc, and scroll the doc
            { "n", "K", require("lspsaga.hover").render_hover_doc, opts, 'lspsaga.render_hover_doc()' },
            { "n", "<C-n>", function() require("lspsaga.action").smart_scroll_with_saga(1) end, opts, },
            { "n", "<C-p>", function() require("lspsaga.action").smart_scroll_with_saga(-1) end, opts, },
            -- show signature help
            { "n", "gk", require("lspsaga.signaturehelp").signature_help, opts, 'lspsaga.signaturehelp()' },
            { "i", "<C-k>", require("lspsaga.signaturehelp").signature_help, opts, 'lspsaga.signaturehelp()' },
            -- rename, close rename win use <C-c> in insert mode or `q` in normal mode or `:q`
            { "n", "<leader>rn", require("lspsaga.rename").lsp_rename, opts, 'lspsaga.rename()' },
            -- diagnostic and errors
            { "n", "<space>e", require("lspsaga.diagnostic").show_line_diagnostics, opts, 'lspsaga.diagnostic()' },
            { "n", "[e", require("lspsaga.diagnostic").goto_prev, opts, 'lspsaga.diagnostic.goto_prev()' },
            { "n", "]e", require("lspsaga.diagnostic").goto_next, opts, 'lspsaga.diagnostic.goto_next()' },
            { "n", "[E", function()
                require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
            end, opts, 'lspsaga.diagnostic.goto_prev(ERROR)' },
            { "n", "]E", function()
                require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
            end, opts, 'lspsaga.diagnostic.goto_next(ERROR)' },
            -- float terminal
            { 'n', '<leader>t', require('lspsaga.floaterm').open_float_terminal, opts, 'lspsaga.open_float_terminal()' }
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
