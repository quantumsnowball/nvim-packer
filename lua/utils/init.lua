local M = {}

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
