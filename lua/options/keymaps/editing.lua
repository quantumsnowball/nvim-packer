local map = require('utils').map

-- t is free
map('n', 't', '<Nop>')
map('n', 'T', '<Nop>')
-- switch case
map('n', 'U', '~')
-- quick set shiftwidth
map('n', '<space>2', ':set shiftwidth=2<cr>')
map('n', '<space>4', ':set shiftwidth=4<cr>')
-- begin and end of Word in visual mode
map('v', 'gk', 'E')
map('v', 'gj', 'B')
-- home and end in normal, visual, operator mode
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
-- toggle spell checking
map('n', '<leader>sc', ':set spell!<cr>')
-- use Tab to toggle matching group
-- -- normal mode: matching brackets or tags (by matchit.vim, need to set remap=true)
-- -- visual mode: easily select the opposite matching whole section
-- -- operation pending mode: can delete, yank, or cut the whole section, very handy!
map({ 'n', 'v', 'o' }, '<Tab>', '%', { remap = true })
map({ 'n', 'v', 'o' }, '[<Tab>', '[m', { remap = true })
map({ 'n', 'v', 'o' }, ']<Tab>', ']m', { remap = true })
