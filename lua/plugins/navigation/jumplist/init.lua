-- jumplist related utils function
-- navigation through jumplist
local isJumpingForward = true
local function toggleJumps()
    if (isJumpingForward) then
        vim.cmd('call feedkeys("gj")')
    else
        vim.cmd('call feedkeys("gk")')
    end
    isJumpingForward = not isJumpingForward
end

-- keymaps
local map = require('utils').map
-- back and forward on jumplist
map('n', 'gj', '<C-o>', {}, 'jumpBackward()')
map('n', 'gk', '<C-i>', {}, 'jumpForward()')
map('n', 'g;', toggleJumps, {}, 'toggleJumps()')

-- autocmd
vim.cmd('autocmd VimEnter * clearjumps')
