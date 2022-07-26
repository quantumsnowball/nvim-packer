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
end

-- create keymap with custom which-key hints
function M.map(mode, keys, command, options, hint)
    -- set keymaps
    vim.keymap.set(mode, keys, command, options)
    -- set hint
    if hint then
        require('which-key').register({ [keys] = hint })
    end
end

return M
