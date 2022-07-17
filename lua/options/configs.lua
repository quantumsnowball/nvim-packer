-- as required by many plugings, should load before all plugins
vim.opt.termguicolors = true
-- enable mouse visual select mode
vim.opt.mouse = 'a'
-- vim buildin syntax highlight
vim.cmd 'syntax on'
-- match parenthesizes formatting
vim.cmd('autocmd BufEnter * hi MatchParen ctermbg=Gray guibg=Gray')
-- always open help in a new tab
vim.cmd("autocmd BufEnter *.txt if &filetype == 'help' | silent wincmd T | endif")
