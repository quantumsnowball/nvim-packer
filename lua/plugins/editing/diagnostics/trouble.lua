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
        local map = require('utils').map
        local opts = { silent = true, noremap = true }
        map("n", "<leader>ss", "<cmd>TroubleToggle<cr>", opts)
        map("n", "<leaderw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
        map("n", "<leader>sd", "<cmd>Trouble document_diagnostics<cr>", opts)
        map("n", "<leader>sl", "<cmd>Trouble loclist<cr>", opts)
        map("n", "<leader>sq", "<cmd>Trouble quickfix<cr>", opts)
        map("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
        map("n", "<leader>sn",
            function()
                require("trouble").next({ skip_groups = true, jump = true })
            end, opts, "Trouble next()")
        map("n", "<leader>sN",
            function()
                require("trouble").previous({ skip_groups = true, jump = true })
            end, opts, "Trouble previous()")
    end
}
