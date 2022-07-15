-------------
-- general --
-------------
-- leader
vim.g.mapleader = ','
-- toggle split windows
vim.keymap.set('n', 'g-', ':split<cr>')
vim.keymap.set('n', 'g\\', ':vsplit<cr>')
-- toggle a new tabpage
vim.keymap.set('n', '<F12>', ':tabnew<cr>')
-- cancel search highlight after search
vim.keymap.set('n', 'znn', ':noh<cr>', { silent = true })
-- quick set shiftwidth
vim.keymap.set('n', '<leader>2', ':set shiftwidth=2<cr>')
vim.keymap.set('n', '<leader>4', ':set shiftwidth=4<cr>')
-- home and end in normal mode
vim.keymap.set('n', 'gh', '^')
vim.keymap.set('n', 'gl', '$')
-- home and end in insert mode
vim.keymap.set('i', '<C-h>', '<home>')
vim.keymap.set('i', '<C-l>', '<end>')
-- shift-tab will go one tab backward
vim.keymap.set('i', '<S-Tab>', '<C-d>')
-- | and \ will break line before and after cursor
vim.keymap.set('n', '|', 'a<C-m><esc>')
vim.keymap.set('n', '\\', 'i<C-m><esc>')
-- go and gO will open new line but stay in normal mode
vim.keymap.set('n', 'gO', 'O<esc>')
vim.keymap.set('n', 'go', 'o<esc>')
-- C-o will also open new line in insert mode
vim.keymap.set('i', '<C-o>', '<esc>o')
-- utils
vim.keymap.set('n', '<F7>', require('options.utils').refresh_configs)
vim.keymap.set('n', '<F8>', require('options.utils').clear_spell_highlights)
---------------
-- clipboard --
---------------
-- copy and paste to system clipboard
vim.cmd 'set clipboard^=unnamed,unnamedplus'
-- swap ; :
vim.keymap.set('n', ';', ':')
-- delete
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('v', 'x', '"_x')
vim.keymap.set('n', 'X', '"_X')
vim.keymap.set('v', 'X', '"_X')
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('v', 'd', '"_d')
vim.keymap.set('n', 'D', '"_D')
vim.keymap.set('v', 'D', '"_D')
-- replace
vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('v', 'c', '"_c')
vim.keymap.set('n', 'C', '"_C')
vim.keymap.set('v', 'C', '"_C')
-- cut
vim.keymap.set('n', '<leader>x', '"+x')
vim.keymap.set('v', '<leader>x', '"+x')
vim.keymap.set('n', '<leader>X', '"+X')
vim.keymap.set('v', '<leader>X', '"+X')
vim.keymap.set('n', '<leader>d', '"+d')
vim.keymap.set('v', '<leader>d', '"+d')
vim.keymap.set('n', '<leader>D', '"+D')
vim.keymap.set('v', '<leader>D', '"+D')
vim.keymap.set('n', '<leader>c', '"+c')
vim.keymap.set('v', '<leader>c', '"+c')
vim.keymap.set('n', '<leader>C', '"+C')
vim.keymap.set('v', '<leader>C', '"+C')
-- visual mode replace without copying the deleted text
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('v', 'P', '"_dP')
