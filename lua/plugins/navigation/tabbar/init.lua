local use = require('packer').use

-- choose your tab bar
require('plugins.navigation.tabbar.bufferline')
-- require('plugins.navigation.tabbar.barbar')
-- require('plugins.navigation.tabbar.tabby')

-- common useful plugin
-- better buffer delete command
require('plugins.navigation.tabbar.vim-bbye')

-- keymaps
require('plugins.navigation.tabbar.keymaps')

-- default split to right and below
vim.opt.splitbelow = true
vim.opt.splitright = true
