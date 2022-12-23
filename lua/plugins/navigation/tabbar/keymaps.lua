--
-- some common related shortcuts
--
local map = require('utils').map

-- navigate between buffers
-- map('n', '<space>j', ':BufferLineCyclePrev<CR>')
-- map('n', '<space>k', ':BufferLineCycleNext<CR>')
-- map('n', '<space>h', ':BufferLineMovePrev<CR>')
-- map('n', '<space>l', ':BufferLineMoveNext<CR>')
-- map('n', 'qj', ':BufferLineCyclePrev<CR>')
-- map('n', 'qk', ':BufferLineCycleNext<CR>')
-- map('n', 'qh', ':BufferLineMovePrev<CR>')
-- map('n', 'ql', ':BufferLineMoveNext<CR>')
map('n', 'qj', ':bprev<CR>')
map('n', 'qk', ':bnext<CR>')
-- map('n', 'qh', ':bfirst<CR>')
-- map('n', 'ql', ':blast<CR>')
map('n', '<space>b', ':e #<CR>')
map('n', 'q;', ':e #<CR>')

-- navigate between tabpages
map('n', 'tj', ':tabprevious<cr>')
map('n', 'tk', ':tabnext<cr>')
map('n', 'th', ':-tabmove<cr>')
map('n', 'tl', ':+tabmove<cr>')
map('n', 'tn', function()
    vim.cmd('tabnew')
    vim.cmd('Alpha')
    require('close_buffers').delete({ type = 'nameless' })
end, {}, 'tabnew_alpha_after')
map('n', 'tN', function()
    vim.cmd('-1tabnew')
    vim.cmd('Alpha')
    require('close_buffers').delete({ type = 'nameless' })
end, {}, 'tabnew_alpha_before')
map('n', 'to', ':tab split<cr>', {}, 'tabnew_current')

-- closing tabs
local close_onto_previous_tab = function()
    local idx = vim.fn.tabpagenr()
    local cnt = vim.fn.tabpagenr('$')
    vim.cmd('tabclose')
    if ((idx ~= 1) and (idx < cnt)) then
        vim.cmd('tabprevious')
    end
end
map('n', 'qt', close_onto_previous_tab, {}, 'close_onto_previous_tab()')
map('n', 'tq', close_onto_previous_tab, {}, 'close_onto_previous_tab()')
map('n', 'tc', ':tabclose<cr>')
map('n', '<leader>T', ':tabs<cr>')
map('n', 't;', 'g<Tab>')
map('n', 'tH', ':tabfirst<cr>')
map('n', 'tL', ':tablast<cr>')

-- quickly go to a tabpage with number 1 to 9
for i = 1, 9, 1 do
    map('n', 't' .. i, i .. 'gt')
    map('n', '<leader>' .. i, i .. 'gt')
end
map('n', 't0', '10gt')
map('n', '<leader>0', '10gt')
