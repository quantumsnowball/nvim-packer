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
        -- close all and other buffer by close-buffers.nvim
        local delete = require('close_buffers').delete
        vim.keymap.set('n', '<space>co', function() delete({ type = 'other' }) end)
        vim.keymap.set('n', '<space>ca', function() delete({ type = 'all' }) end)
    end
}

-- some common related shortcuts
-- navigate between buffers
vim.keymap.set('n', '<space>h', ':bprevious<CR>')
vim.keymap.set('n', '<space>j', ':bprevious<CR>')
vim.keymap.set('n', '<space>k', ':bnext<CR>')
vim.keymap.set('n', '<space>l', ':bnext<CR>')
vim.keymap.set('n', '<space>b', ':e #<CR>')
-- default split to right and below
vim.opt.splitbelow = true
vim.opt.splitright = true
-- quickly go to a tabpage with number
vim.keymap.set('n', '<M-1>', '1gt')
vim.keymap.set('n', '<M-2>', '2gt')
vim.keymap.set('n', '<M-3>', '3gt')
vim.keymap.set('n', '<M-4>', '4gt')
