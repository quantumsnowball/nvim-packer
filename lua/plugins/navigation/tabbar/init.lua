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
        local close_other = function()
            vim.cmd('NvimTreeClose')
            delete({ type = 'other' })
        end
        local close_all = function()
            vim.cmd('NvimTreeClose')
            vim.cmd('Alpha')
            delete({ type = 'all' })
        end
        -- keymaps
        map('n', '<space>co', close_other, nil, 'close_other_buffers()')
        map('n', '<space>ca', close_all, nil, 'close_all_buffers()')
        map('n', 'qo', close_other, nil, 'close_other_buffers()')
        map('n', 'qa', close_all, nil, 'close_all_buffers()')
    end
}

-- some common related shortcuts
local map = require('utils').map
-- navigate between buffers
map('n', '<space>j', ':BufferLineCyclePrev<CR>')
map('n', '<space>k', ':BufferLineCycleNext<CR>')
map('n', '<space>h', ':BufferLineMovePrev<CR>')
map('n', '<space>l', ':BufferLineMoveNext<CR>')
map('n', 'qj', ':BufferLineCyclePrev<CR>')
map('n', 'qk', ':BufferLineCycleNext<CR>')
map('n', 'qh', ':BufferLineMovePrev<CR>')
map('n', 'ql', ':BufferLineMoveNext<CR>')
map('n', '<space>b', ':e #<CR>')
map('n', ':', ':e #<CR>')
map('n', 'q;', ':e #<CR>')
-- navigate between tabpages
map('n', 'tj', ':tabprevious<cr>')
map('n', 'tk', ':tabnext<cr>')
map('n', 'th', ':tabfirst<cr>')
map('n', 'tl', ':tablast<cr>')
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
-- default split to right and below
vim.opt.splitbelow = true
vim.opt.splitright = true
-- quickly go to a tabpage with number 1 to 9
for i = 1, 9, 1 do
    map('n', 't' .. i, i .. 'gt')
end
