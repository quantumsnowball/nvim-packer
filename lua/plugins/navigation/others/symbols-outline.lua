local use = require('packer').use


-- outline
-- https://github.com/simrat39/symbols-outline.nvim
use {
    'simrat39/symbols-outline.nvim',
    config = function()
        local map = require('utils').map
        map('n', '<leader>o', ':SymbolsOutline<cr>')
        map('n', '<leader>m', ':SymbolsOutline<cr>')
        -- override defaults
        vim.g.symbols_outline = {
            preview_bg_highlight = 'Pmenu',
            winblend = 30,
            auto_preview = false,
            keymaps = {
                focus_location = { "o", "H" },
                hover_symbol = "K",
                toggle_preview = { "J", "<Tab>" },
            }
        }
    end
}
