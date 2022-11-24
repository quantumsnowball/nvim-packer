local M = {}

-- create keymap with custom which-key hints
function M.map(mode, keys, command, options, hint)
    -- set keymaps
    vim.keymap.set(mode, keys, command, options)
end

return M
