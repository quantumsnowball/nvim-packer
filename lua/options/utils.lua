local M = {}

-- clear spell highlights
function M.clear_spell_highlights()
    for _, suffix in ipairs({ 'Bad', 'Local', 'Cap', 'Rare' }) do
        vim.cmd('hi Spell' .. suffix .. ' ctermbg=NONE gui=NONE guifg=NONE guisp=NONE')
    end
end

-- refresh the config
function M.refresh_configs()
    vim.cmd(':PackerCompile<cr>')
    vim.cmd(':LspRestart<cr>')
    print('refresh_configs: executed ":PackerCompile" and ":LspRestart"')
end

return M
