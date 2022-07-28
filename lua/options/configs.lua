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
-- add margins when scrolling with curosr
vim.opt.scrolloff = 5
-- set scroll=5 for normal buffer
vim.cmd('autocmd BufEnter,WinScrolled * if &buftype == "" | set scroll=5 | endif')
-- WipeReg
vim.cmd('command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor')
-- vim.cmd('autocmd VimEnter * WipeReg')
-- treat dash-connected word as single word
vim.cmd('set iskeyword+=-')
-- write and delete buffer command
vim.cmd [[cnoreabbrev wd w\|bd"]]
