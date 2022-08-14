-- global leader key
vim.g.mapleader = ','

-- copy and paste to system clipboard
vim.cmd 'set clipboard^=unnamed,unnamedplus'

-- keymaps and hints
local map = require('utils').map
-------------
-- general --
-------------
-- quit windo shortcut
map('n', 'qw', ':q<cr>')
map('n', 'qW', ':qa<cr>')
-- show which-key root
map('n', '<F1>', ':WhichKey<cr>', { silent = true })
-- toggle split windows
map('n', 'g-', ':split<cr>')
map('n', 'g\\', ':vsplit<cr>')
-- toggle a new tabpage
map('n', '<F12>', ':tabnew<cr>')
-- cancel search highlight after search
map('n', 'znn', ':noh<cr>', {}, 'Clear search result highlight')
-- G also center line
map('n', 'G', 'Gzz')
-- <leader>Q records macro, q is free
map('n', '<leader>q', 'q')
map('n', 'q', '<Nop>')
-- toggle spell checking
map('n', '<leader>sc', ':set spell!<cr>')
-- quick set shiftwidth
map('n', '<leader>2', ':set shiftwidth=2<cr>')
map('n', '<leader>4', ':set shiftwidth=4<cr>')
-- home and end in normal mode
map({ 'n', 'v', 'o' }, 'gh', '^', {}, 'Home')
map({ 'n', 'v', 'o' }, 'gl', '$', {}, 'End')
-- home and end in insert mode
map('i', '<C-h>', '<home>')
map('i', '<C-l>', '<end>')
-- shift-tab will go one tab backward
map('i', '<S-Tab>', '<C-d>')
-- | and \ will break line before and after cursor
map('n', '|', 'a<C-m><esc>')
map('n', '\\', 'i<C-m><esc>')
-- go and gO will open new line but stay in normal mode
map('n', 'gO', 'O<esc>')
map('n', 'go', 'o<esc>')
-- C-o will also open new line in insert mode
map('i', '<C-o>', '<esc>o')
-- utils
map('n', '<F7>', require('options.utils').refresh_configs, {}, 'utils.refresh_configs()')
map('n', '<leader>rl', require('options.utils').refresh_configs, {}, 'utils.refresh_configs()')
-- toggle word wrap
map('n', 'gw', ':set wrap!<cr>')
-- use Tab to toggle matching group
-- -- normal mode: matching brackets or tags (by matchit.vim, need to set remap=true)
-- -- visual mode: easily select the opposite matching whole section
-- -- operation pending mode: can delete, yank, or cut the whole section, very handy!
map({ 'n', 'v', 'o' }, '<Tab>', '%', { remap = true })
map({ 'n', 'v', 'o' }, '[<Tab>', '[m', { remap = true })
map({ 'n', 'v', 'o' }, ']<Tab>', ']m', { remap = true })
---------------
-- clipboard --
---------------
-- swap ; :
map('n', ';', ':')
-- delete
map('n', 'x', '"_x')
map('v', 'x', '"_x')
map('n', 'X', '"_X')
map('v', 'X', '"_X')
map('n', 'd', '"_d')
map('v', 'd', '"_d')
map('n', 'D', '"_D')
map('v', 'D', '"_D')
-- replace
map('n', 'c', '"_c')
map('v', 'c', '"_c')
map('n', 'C', '"_C')
map('v', 'C', '"_C')
-- cut
map('n', '<leader>x', '"+x')
map('v', '<leader>x', '"+x')
map('n', '<leader>X', '"+X')
map('v', '<leader>X', '"+X')
map('n', '<leader>d', '"+d')
map('v', '<leader>d', '"+d')
map('n', '<leader>D', '"+D')
map('v', '<leader>D', '"+D')
map('n', '<leader>c', '"+c')
map('v', '<leader>c', '"+c')
map('n', '<leader>C', '"+C')
map('v', '<leader>C', '"+C')
-- visual mode replace without copying the deleted text
map('v', 'p', '"_dP')
map('v', 'P', '"_dP')
-- cursor position after paste
map('n', 'P', 'gP')
map('n', 'gP', 'P')
map('n', 'p', 'p`]')
-- *aa as change all text operation
map('n', 'vaa', 'ggVG', {}, 'select all text')
map('n', 'yaa', 'ggVGy', {}, 'copy all text')
map('n', 'daa', 'ggVG"_d', {}, 'delete all text')
map('n', '<leader>daa', 'ggVGd', {}, 'cut all text')
map('n', 'caa', 'ggVG"_c', {}, 'change all text')
