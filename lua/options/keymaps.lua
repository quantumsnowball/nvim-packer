-- global leader key
vim.g.mapleader = ','
-- copy and paste to system clipboard
vim.cmd 'set clipboard^=unnamed,unnamedplus'
-- keymaps and hints
for _, item in pairs({
    -------------
    -- general --
    -------------
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
    { 'n', '<F8>', require('options.utils').clear_spell_highlights, {}, 'utils.clear_spell_highlights()' },
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
}) do
    -- unpack values
    -- -- neovim still using lua 5.1, new version use `table.unpack`
    local mode, keys, command, options, hint = unpack(item)
    -- register as vim key maps
    vim.keymap.set(mode, keys, command, options)
    -- register as which-key hints
    if hint then
        require('which-key').register({ [keys] = hint })
    end
end
