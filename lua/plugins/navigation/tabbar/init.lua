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
        -- close last buffer doesn't play well with nvimtree, using vim-bbye now
        vim.keymap.set('n', '<M-w>', ':Bdelete<CR>')
        vim.keymap.set('n', '<space>x', ':Bdelete<CR>')
        vim.keymap.set('n', 'qb', ':Bdelete<CR>')
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
        local map = require('utils').map
        map('n', '<space>co', close_other, nil, 'close_other_buffers()')
        map('n', '<space>ca', close_all, nil, 'close_all_buffers()')
        map('n', 'qo', close_other, nil, 'close_other_buffers()')
        map('n', 'qa', close_all, nil, 'close_all_buffers()')
    end
}

-- some common related shortcuts
-- navigate between buffers
vim.keymap.set('n', '<space>j', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<space>k', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<space>h', ':BufferLineMovePrev<CR>')
vim.keymap.set('n', '<space>l', ':BufferLineMoveNext<CR>')
vim.keymap.set('n', 'qj', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', 'qk', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', 'qh', ':BufferLineMovePrev<CR>')
vim.keymap.set('n', 'ql', ':BufferLineMoveNext<CR>')
vim.keymap.set('n', '<space>b', ':e #<CR>')
vim.keymap.set('n', ':', ':e #<CR>')
vim.keymap.set('n', 'q;', ':e #<CR>')
-- default split to right and below
vim.opt.splitbelow = true
vim.opt.splitright = true
-- quickly go to a tabpage with number
vim.keymap.set('n', '<M-1>', '1gt')
vim.keymap.set('n', '<M-2>', '2gt')
vim.keymap.set('n', '<M-3>', '3gt')
vim.keymap.set('n', '<M-4>', '4gt')
