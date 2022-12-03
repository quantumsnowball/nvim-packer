local use = require('packer').use

use {
    'fedepujol/move.nvim',
    config = function()
        local map = require('utils').map
        local opts = { silent = true }
        -- Normal-mode
        map('n', '<C-down>', ':MoveLine(1)<CR>', opts)
        map('n', '<C-up>', ':MoveLine(-1)<CR>', opts)
        -- map('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
        -- map('n', '<A-l>', ':MoveHChar(1)<CR>', opts)

        -- Visual-mode
        --   ctrl + arrows
        map('v', '<C-down>', ':MoveBlock(1)<CR>', opts)
        map('v', '<C-up>', ':MoveBlock(-1)<CR>', opts)
        map('v', '<C-left>', ':MoveHBlock(-1)<CR>', opts)
        map('v', '<C-right>', ':MoveHBlock(1)<CR>', opts)
        --   g + hjkl
        map('v', 'gj', ':MoveBlock(1)<CR>', opts)
        map('v', 'gk', ':MoveBlock(-1)<CR>', opts)
    end
}
