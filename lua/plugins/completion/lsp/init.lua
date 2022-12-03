-- LSP support for neovim
require('plugins.completion.lsp.nvim-lspconfig')
-- LSP installer
require('plugins.completion.lsp.installer')
-- LSP enhanced - lspsaga
require('plugins.completion.lsp.extensions')

-----------
-- Debug --
-----------
-- try to force FileType autocmd on these events, avoiding the lsp cmd not found startup bug
vim.cmd('autocmd VimEnter,BufEnter * doautocmd FileType')
