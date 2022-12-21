local use = require('packer').use


-- code action popup menu
-- https://github.com/weilbith/nvim-code-action-menu
use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu'
}
-- this plugin is lazy loading so preconfig the keymap before it is first loaded
require('utils').map('n', '<leader>qf', ':CodeActionMenu<cr>')
-- helper to jump to prev/next code action and launch quick fix
require('utils').map('n', '[qf', ':call feedkeys("[e,qf")<cr>')
require('utils').map('n', ']qf', ':call feedkeys("]e,qf")<cr>')
