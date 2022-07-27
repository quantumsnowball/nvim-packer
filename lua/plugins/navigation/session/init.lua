local use = require('packer').use

-- session manager
-- https://github.com/Shatur/neovim-session-manager
use {
    'Shatur/neovim-session-manager',
    config = function()
        -- plugin custom
        require('session_manager').setup({
            -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
            autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
            -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
            autosave_ignore_not_normal = false,
        })
        -- autoload file explorer upon session loaded
        local config_group = vim.api.nvim_create_augroup('SessionManagerCommandGroup', {})
        -- A global group for all your config autocommands
        -- vim.api.nvim_create_autocmd({ 'SessionLoadPost' }, {
        --     group = config_group,
        --     callback = function()
        --         -- auto start nvim-tree when session loaded
        --         require('nvim-tree').toggle(false, true)
        --     end,
        -- })
    end
}
