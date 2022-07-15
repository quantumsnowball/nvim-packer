local use = require('packer').use


-- code action popup menu
-- https://github.com/weilbith/nvim-code-action-menu
use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu'
}
-- this plugin is lazy loading so preconfig the keymap before it is first loaded
vim.keymap.set('n', '<leader>qf', ':CodeActionMenu<cr>')

-- code action lightbulb gutter icon
-- https://github.com/kosayoda/nvim-lightbulb
use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
    config = function()
        require('nvim-lightbulb').setup({ autocmd = { enabled = true } })
    end
}
