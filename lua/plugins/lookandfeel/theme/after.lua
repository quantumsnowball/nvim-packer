--[[
-- run only after colorscheme has been loaded
--]]
-- disable wrong spell highlight
for _, suffix in ipairs({ 'Bad', 'Local', 'Cap', 'Rare' }) do
    -- colorscheme will reset these hi group, ensure tthis is run after setting colorscheme
    vim.cmd('hi Spell' .. suffix .. ' ctermbg=NONE gui=NONE guifg=NONE guisp=NONE')
end
