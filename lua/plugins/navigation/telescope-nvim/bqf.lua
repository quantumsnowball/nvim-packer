local use = require('packer').use


-- nvim-bqf, show a preview window above quickfix list
-- https://github.com/kevinhwang91/nvim-bqf
use {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
        -- official recommended settings
        vim.cmd([[
            hi BqfPreviewBorder guifg=#50a14f ctermfg=71
            hi link BqfPreviewRange Search
        ]])
        require('bqf').setup({
            auto_enable = true,
            auto_resize_height = true, -- highly recommended enable
            preview = {
                win_height = 12,
                win_vheight = 12,
                delay_syntax = 80,
                border_chars = { '┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█' },
                should_preview_cb = function(bufnr, qwinid)
                    local ret = true
                    local bufname = vim.api.nvim_buf_get_name(bufnr)
                    local fsize = vim.fn.getfsize(bufname)
                    if fsize > 100 * 1024 then
                        -- skip file size greater than 100k
                        ret = false
                    elseif bufname:match('^fugitive://') then
                        -- skip fugitive buffer
                        ret = false
                    end
                    return ret
                end
            },
            -- make `drop` and `tab drop` to become preferred
            func_map = {
                drop = 'o',
                openc = 'O',
                split = '<C-s>',
                tabdrop = '<C-t>',
                tabc = '',
                ptogglemode = 'z,',
            },
            filter = {
                fzf = {
                    action_for = { ['ctrl-s'] = 'split', ['ctrl-t'] = 'tab drop' },
                    extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' }
                }
            }
        })
        -- quick fix list related keymaps
        local map = require('utils').map
        map('n', 'qn', ':cnext<cr>', {}, 'quickfix_list.next()')
        map('n', 'qp', ':cprevious<cr>', {}, 'quickfix_list.previous()')
        map('n', 'qo', ':copen<cr>', {}, 'quickfix_list.open()')
        map('n', 'qc', ':cclose<cr>', {}, 'quickfix_list.close()')
    end
}
-- optional, as recommended by nvim-bqf
-- fzf
-- https://github.com/junegunn/fzf
use {
    'junegunn/fzf',
    run = function()
        vim.fn['fzf#install']()
    end
}
