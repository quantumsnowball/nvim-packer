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
for _, item in pairs({
    -- back and forward on jumplist
    { 'n', 'gj', '<C-o>', {}, 'jumpBackward' },
    { 'n', 'gk', '<C-i>', {}, 'jumpForward' },
    { 'n', 'g;', toggleJumps, {}, 'toggleJumps()' }
}) do
    local mode, keys, command, options, hint = unpack(item)
    require('utils').map(mode, keys, command, options, hint)
end
