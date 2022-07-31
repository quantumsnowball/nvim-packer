-- simple custom function
-- toggle maximize pane and restore
local isZoomed = false

local function toggleMaximize()
    if (isZoomed) then
        vim.cmd 'wincmd ='
    else
        vim.api.nvim_win_set_width(0, 99999)
        vim.api.nvim_win_set_height(0, 99999)
    end
    isZoomed = not isZoomed
end

for _, item in pairs({
    { 'n', 'gm', toggleMaximize },
    { 'n', '<leader>z', toggleMaximize },

}) do
    local mode, keys, command = unpack(item)
    require('utils').map(mode, keys, command, nil, 'toggleMaximize()')
end

-- toggle maximize pane and restore
-- https://github.com/szw/vim-maximizer
-- use {
--     'https://github.com/szw/vim-maximizer',
--     config = function()
--         vim.keymap.set('n', 'gm', ':MaximizerToggle<cr>')
--     end
-- }
-- P.S. disabled because conflict with winbar/incline
