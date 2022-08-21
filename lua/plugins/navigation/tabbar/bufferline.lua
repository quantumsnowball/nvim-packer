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
                show_close_icons = false,
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
                            or (e == "warning" and " " or "")
                        s = s .. n .. sym
                    end
                    return s
                end
            }
        }
    end
}
