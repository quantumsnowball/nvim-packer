-- global leader key
vim.g.mapleader = ','

-- copy and paste to system clipboard
vim.cmd 'set clipboard^=unnamed,unnamedplus'

-- keymaps and hints
require('options.keymaps.general')
require('options.keymaps.clipboard')
require('options.keymaps.editing')
