local map = require('utils').map
-------------
-- general --
-------------
-- quick save buffer
map('n', '<c-s>', ':w<cr>')
map('i', '<c-s>', '<c-o>:w<cr>')
map('v', '<c-s>', '<esc>:w<cr>')
map('n', 'qs', ':noautocmd w<cr>')
-- quit windo shortcut
map('n', 'qw', ':q<cr>')
map('n', 'qW', ':qa<cr>')
map('n', 'qv', ':qa<cr>')
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
-- t is free
map('n', 't', '<Nop>')
map('n', 'T', '<Nop>')
-- toggle spell checking
map('n', '<leader>sc', ':set spell!<cr>')
-- switch case
map('n', 'U', '~')
-- quick set shiftwidth
map('n', '<space>2', ':set shiftwidth=2<cr>')
map('n', '<space>4', ':set shiftwidth=4<cr>')
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
