local use = require('packer').use
-- hjkl navigator in vim and tmux windows
-- https://github.com/christoomey/vim-tmux-navigator
use {
    'christoomey/vim-tmux-navigator',
    config = function()
        local map = require('utils').map
        local opts = { silent = true }
        -- enable ctrl + hjkl only in normal mode
        vim.g.tmux_navigator_no_mappings = 1
        map('n', '<C-k>', ':TmuxNavigateUp<cr>', opts)
        map('n', '<C-j>', ':TmuxNavigateDown<cr>', opts)
        map('n', '<C-h>', ':TmuxNavigateLeft<cr>', opts)
        map('n', '<C-l>', ':TmuxNavigateRight<cr>', opts)
    end
}

-- jumplist related utils function
-- navigation through jumplist
-- local isJumpingForward = true
-- local function toggleJumps()
--     if (isJumpingForward) then
--         vim.cmd('call feedkeys("gj")')
--     else
--         vim.cmd('call feedkeys("gk")')
--     end
--     isJumpingForward = not isJumpingForward
-- end

-- keymaps
local map = require('utils').map
-- back and forward on jumplist
-- map('n', 'gj', '<C-o>', {}, 'jumpBackward()')
-- map('n', 'gk', '<C-i>', {}, 'jumpForward()')
-- map('n', 'g;', toggleJumps, {}, 'toggleJumps()')

-- autocmd
vim.cmd('autocmd VimEnter * clearjumps')

-- gj, gk simply jumping between sections
map('n', 'gj', '}')
map('n', 'gk', '{')
