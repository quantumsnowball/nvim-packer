local use = require('packer').use

-- choose your tab bar
require('plugins.navigation.tabbar.bufferline')
-- require('plugins.navigation.tabbar.barbar')
-- require('plugins.navigation.tabbar.tabby')

-- common useful plugin
-- better buffer delete command
-- https://github.com/kazhala/close-buffers.nvim
use {
    'moll/vim-bbye',
    requires = 'kazhala/close-buffers.nvim',
    config = function()
        local map = require('utils').map
        -- close last buffer doesn't play well with nvimtree, using vim-bbye now
        map('n', '<M-w>', ':Bdelete<CR>')
        map('n', '<space>x', ':Bdelete<CR>')
        map('n', 'qb', ':Bdelete<CR>')
        -- close all and other buffer by close-buffers.nvim
        local delete = require('close_buffers').delete
        local close_all_buffers = function()
            vim.cmd('NvimTreeClose')
            vim.cmd('Alpha')
            vim.cmd('tabonly')
            delete({ type = 'other' })
        end
        local close_hidden_buffers = function()
            delete({ type = 'hidden' })
        end
        local close_other_tabpages = function()
            vim.cmd('tabonly')
            delete({ type = 'hidden' })
        end
        -- keymaps
        map('n', 'qa', close_all_buffers, nil, 'close_all_buffers()')
        map('n', 'qh', close_hidden_buffers, nil, 'close_all_hidden_buffers()')
        map('n', 'qo', close_other_tabpages, nil, 'close_other_tabpages()')
    end
}

-- some common related shortcuts
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
end, {}, 'tabnew_alpha')
map('n', 'to', ':tab split<cr>', {}, 'tabnew_current')
map('n', 'tq', ':tabclose<cr>')
map('n', 'qt', ':tabclose<cr>')
map('n', 'tc', ':tabclose<cr>')
map('n', 'tc', ':tabclose<cr>')
map('n', '<leader>T', ':tabs<cr>')
map('n', 't;', 'g<Tab>')
map('n', 'tH', ':tabfirst<cr>')
map('n', 'tL', ':tablast<cr>')
-- default split to right and below
vim.opt.splitbelow = true
vim.opt.splitright = true
-- quickly go to a tabpage with number 1 to 9
for i = 1, 9, 1 do
    map('n', 't' .. i, i .. 'gt')
    map('n', '<leader>' .. i, i .. 'gt')
end
map('n', 't0', '10gt')
map('n', '<leader>0', '10gt')
