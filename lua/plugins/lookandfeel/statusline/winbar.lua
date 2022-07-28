local use = require('packer').use

-- winbar.nvim
-- https://github.com/fgheng/winbar.nvim
-- use {
--     'fgheng/winbar.nvim',
--     config = function()
--         require('winbar').setup({
--             enabled = true,
--             show_file_path = true,
--             show_symbols = true,
--             colors = {
--                 -- path = '#ffffff',
--                 -- file_name = '#84ffff',
--                 -- symbols = '',
--             },
--             icons = {
--                 file_icon_default = '',
--                 seperator = '>',
--                 editor_state = '●',
--                 lock_icon = '',
--             },
--             exclude_filetype = {
--                 'help',
--                 'startify',
--                 'dashboard',
--                 'packer',
--                 'neogitstatus',
--                 'NvimTree',
--                 'Trouble',
--                 'alpha',
--                 'lir',
--                 'Outline',
--                 'spectre_panel',
--                 'toggleterm',
--                 'qf',
--             }
--         })
--     end
-- }
-- P.s. the above plugin is temporarily disabled due to conflict with telescope

-- custom winbar
-- reference:
-- https://alpha2phi.medium.com/neovim-for-beginners-window-bar-e7b4435fc7e9
local function winbar()
    if vim.tbl_contains({
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "alpha",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
    }, vim.bo.filetype) then
        return ''
    else
        return "%f"
    end

end

-- vim.api.nvim_set_hl(0, "WinBarPath", { fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "WinBarFile", { fg = "#ff0000", bg = "#000000" })

vim.api.nvim_create_autocmd({
    'DirChanged',
    'BufRead',
    -- 'CursorMoved',
    -- 'BufWinEnter',
    -- 'BufFilePost',
    -- 'InsertEnter',
    -- 'BufWritePost'
}, {
    callback = function()
        vim.opt_local.winbar = winbar()
    end
})
