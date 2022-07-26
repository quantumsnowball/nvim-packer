local use = require('packer').use


-- Trouble
-- https://github.com/folke/trouble.nvim
use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        -- configs
        require("trouble").setup {
            height = 7,
            padding = false,
            auto_close = true
        }
        -- keymaps
        local options = { silent = true, noremap = true }
        for _, item in pairs({
            { "n", "<leader>ss", "<cmd>TroubleToggle<cr>", },
            { "n", "<leaderw", "<cmd>Trouble workspace_diagnostics<cr>", },
            { "n", "<leader>sd", "<cmd>Trouble document_diagnostics<cr>", },
            { "n", "<leader>sl", "<cmd>Trouble loclist<cr>", },
            { "n", "<leader>sq", "<cmd>Trouble quickfix<cr>", },
            { "n", "gR", "<cmd>Trouble lsp_references<cr>", },
            { "n", "<leader>sn", function()
                require("trouble").next({ skip_groups = true, jump = true })
            end, "Trouble next()" },
            { "n", "<leader>sN", function()
                require("trouble").previous({ skip_groups = true, jump = true })
            end, "Trouble previous()" },
        }) do
            local mode, keys, command, hint = unpack(item)
            require('utils').map(mode, keys, command, options, hint)
        end
    end
}
