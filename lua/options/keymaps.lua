-- global leader key
vim.g.mapleader = ','
-- copy and paste to system clipboard
vim.cmd 'set clipboard^=unnamed,unnamedplus'
-- keymaps and hints
for _, item in pairs({
    -------------
    -- general --
    -------------
    -- word navigation
    { 'n', 'W', 'b' }, -- w, W search through [w]ords forward and backward
    { 'n', 'b', 'W' }, -- b, B search through [b]locks of text forward and backward
    { 'n', 'E', 'ge' }, -- e, E search through [e]end of words forward and backward
    { 'n', 'ge', 'E' }, -- e, E search through [e]end of words forward and backward
    -- show which-key root
    { 'n', '<F1>', ':WhichKey<cr>', { silent = true } },
    -- toggle split windows
    { 'n', 'g-', ':split<cr>' },
    { 'n', 'g\\', ':vsplit<cr>' },
    -- toggle a new tabpage
    { 'n', '<F12>', ':tabnew<cr>' },
    -- cancel search highlight after search
    { 'n', 'znn', ':noh<cr>', {}, 'Clear search result highlight' },
    -- G also center line
    { 'n', 'G', 'Gzz' },
    -- <leader>Q records macro, q is free
    { 'n', '<leader>q', 'q' },
    { 'n', 'q', '<Nop>' },
    -- toggle spell checking
    { 'n', '<leader>sc', ':set spell!<cr>' },
    -- quick set shiftwidth
    { 'n', '<leader>2', ':set shiftwidth=2<cr>' },
    { 'n', '<leader>4', ':set shiftwidth=4<cr>' },
    -- home and end in normal mode
    { { 'n', 'v', 'o' }, 'gh', '^', {}, 'Home' },
    { { 'n', 'v', 'o' }, 'gl', '$', {}, 'End' },
    -- home and end in insert mode
    { 'i', '<C-h>', '<home>' },
    { 'i', '<C-l>', '<end>' },
    -- shift-tab will go one tab backward
    { 'i', '<S-Tab>', '<C-d>' },
    -- | and \ will break line before and after cursor
    { 'n', '|', 'a<C-m><esc>' },
    { 'n', '\\', 'i<C-m><esc>' },
    -- go and gO will open new line but stay in normal mode
    { 'n', 'gO', 'O<esc>' },
    { 'n', 'go', 'o<esc>' },
    -- C-o will also open new line in insert mode
    { 'i', '<C-o>', '<esc>o' },
    -- utils
    { 'n', '<F7>', require('options.utils').refresh_configs, {}, 'utils.refresh_configs()' },
    { 'n', '<leader>rl', require('options.utils').refresh_configs, {}, 'utils.refresh_configs()' },
    -- toggle word wrap
    { 'n', 'gw', ':set wrap!<cr>' },
    -- use Tab to toggle matching group
    -- -- normal mode: matching brackets or tags (by matchit.vim, need to set remap=true)
    -- -- visual mode: easily select the opposite matching whole section
    -- -- operation pending mode: can delete, yank, or cut the whole section, very handy!
    { { 'n', 'v', 'o' }, '<Tab>', '%', { remap = true } },
    { { 'n', 'v', 'o' }, '[<Tab>', '[m', { remap = true } },
    { { 'n', 'v', 'o' }, ']<Tab>', ']m', { remap = true } },
    ---------------
    -- clipboard --
    ---------------
    -- swap ; :
    { 'n', ';', ':' },
    -- delete
    { 'n', 'x', '"_x' },
    { 'v', 'x', '"_x' },
    { 'n', 'X', '"_X' },
    { 'v', 'X', '"_X' },
    { 'n', 'd', '"_d' },
    { 'v', 'd', '"_d' },
    { 'n', 'D', '"_D' },
    { 'v', 'D', '"_D' },
    -- replace
    { 'n', 'c', '"_c' },
    { 'v', 'c', '"_c' },
    { 'n', 'C', '"_C' },
    { 'v', 'C', '"_C' },
    -- cut
    { 'n', '<leader>x', '"+x' },
    { 'v', '<leader>x', '"+x' },
    { 'n', '<leader>X', '"+X' },
    { 'v', '<leader>X', '"+X' },
    { 'n', '<leader>d', '"+d' },
    { 'v', '<leader>d', '"+d' },
    { 'n', '<leader>D', '"+D' },
    { 'v', '<leader>D', '"+D' },
    { 'n', '<leader>c', '"+c' },
    { 'v', '<leader>c', '"+c' },
    { 'n', '<leader>C', '"+C' },
    { 'v', '<leader>C', '"+C' },
    -- visual mode replace without copying the deleted text
    { 'v', 'p', '"_dP' },
    { 'v', 'P', '"_dP' },
    -- cursor position after paste
    { 'n', 'P', 'gP' },
    { 'n', 'gP', 'P' },
    { 'n', 'p', 'p`]' },
    -- *aa as change all text operation
    { 'n', 'vaa', 'ggVG', {}, 'select all text' },
    { 'n', 'yaa', 'ggVGy', {}, 'copy all text' },
    { 'n', 'daa', 'ggVG"_d', {}, 'delete all text' },
    { 'n', '<leader>daa', 'ggVGd', {}, 'cut all text' },
    { 'n', 'caa', 'ggVG"_c', {}, 'change all text' },
}) do
    local mode, keys, command, options, hint = unpack(item)
    require('utils').map(mode, keys, command, options, hint)
end
