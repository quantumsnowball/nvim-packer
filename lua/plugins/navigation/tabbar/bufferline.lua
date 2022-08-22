local use = require('packer').use

-- buffer tabs
-- https://github.com/akinsho/bufferline.nvim
use {
    'akinsho/bufferline.nvim', tag = "v2.*",
    requires = {
        'kyazdani42/nvim-web-devicons'
    },
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup {
            options = {
                -- mode = 'tabs', -- enable to show tabpages mode
                offsets = { { filetype = "NvimTree", text = "NvimTree", text_align = "left" } },
                show_buffer_close_icons = false,
                -- only show active buffer in the current tabpage on bufferline
                custom_filter = function(cur_buf_num, _)
                    local win_buf_ls = vim.fn.tabpagebuflist(vim.fn.tabpagenr())
                    for _, buf_num in pairs(win_buf_ls) do
                        if cur_buf_num == buf_num then
                            return true
                        end
                    end
                    return false
                end,
                -- diagnostics infos
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(_, _, diagnostics_dict, _)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " "
                            or (e == "warning" and " " or " ")
                        s = s .. n .. sym
                    end
                    return s
                end,
                -- click to focus win containing the buffer
                left_mouse_command = function(bufnr)
                    local tabnr = vim.fn.tabpagenr()
                    local wins = vim.api.nvim_tabpage_list_wins(tabnr)
                    local targetWin = vim.fn.bufwinid(bufnr)
                    for _, win in ipairs(wins) do
                        if win == targetWin then
                            vim.api.nvim_set_current_win(targetWin)
                            return
                        end
                    end
                end
            }
        }
    end
}
