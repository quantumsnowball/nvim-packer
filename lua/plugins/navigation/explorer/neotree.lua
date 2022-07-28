local use = require('packer').use

-- neo-tree
-- https://github.com/nanozuki/tabby.nvim
use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- toggle shortcut
        vim.keymap.set('n', '<leader>e', ':NeoTreeShowToggle<CR>')
        require('neo-tree').setup({
            window = {
                width = 30,
                mappings = {
                    ['o'] = { 'toggle_node' },
                    ['<space>'] = { nil },
                }
            }
        })
    end
}
