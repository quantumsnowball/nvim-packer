local use = require('packer').use

-- colorful editor theme
-- https://github.com/tanvirtin/monokai.nvim
use {
    'tanvirtin/monokai.nvim',
    config = function()
        -- set themes
        vim.cmd 'colorscheme monokai_ristretto'
        -- transparent background
        vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
        -- disable wrong spell highlight
        for i, suffix in ipairs({ 'Bad', 'Local', 'Cap', 'Rare' }) do
            vim.cmd('hi Spell' .. suffix .. ' ctermbg=NONE gui=NONE guifg=NONE guisp=NONE')
        end
    end
}

-- dashboard
require('plugins.lookandfeel.firstpage')

-- status line
require('plugins.lookandfeel.statusline')
