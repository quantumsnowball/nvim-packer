--[[
-- run only after colorscheme has been loaded
--]]
-- transparent background
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
-- disable wrong spell highlight
for _, suffix in ipairs({ 'Bad', 'Local', 'Cap', 'Rare' }) do
    vim.cmd('hi Spell' .. suffix .. ' ctermbg=NONE gui=NONE guifg=NONE guisp=NONE')
end
