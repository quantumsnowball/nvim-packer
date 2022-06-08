-------------
-- general --
-------------
-- toggle split windows
vim.keymap.set('n', 'g-', ':split<cr>')
vim.keymap.set('n', 'g\\', ':vsplit<cr>')
-- toggle a new tabpage
vim.keymap.set('n', '<F12>', ':tabnew<cr>')
-- copy and paste to system clipboard
vim.cmd 'set clipboard^=unnamed,unnamedplus'
-- cancel search highlight after search
vim.keymap.set('n', 'znn', ':noh<cr>', { silent = true })
-------------
-- keymaps --
-------------
-- leader
vim.g.mapleader = ','
-- swap ; :
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
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
-- paste replace
vim.cmd 'xnoremap <silent> p p:let @+=@0<CR>'
