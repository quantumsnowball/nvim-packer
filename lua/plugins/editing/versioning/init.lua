local use = require('packer').use


-- show git changes
-- https://github.com/lewis6991/gitsigns.nvim
use {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
        -- show line number
        vim.opt.number = true
        -- always include sign column to fix gutter width
        vim.opt.signcolumn = 'yes'
        -- highlight current line and column
        vim.opt.cursorline = true
    end
}
-- lazygit version control
--
use {
    'kdheepak/lazygit.nvim',
    config = function()
        -- toggle keymap
        vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>')
    end
}
-- git fugitive
use {
    'tpope/vim-fugitive',
    config = function()
        for _, item in pairs({
            { 'n', '<leader>Gd', ':Gvdiff<cr>', {}, 'telescope.diagnostics()' },
        }) do
            -- unpack values
            -- -- neovim still using lua 5.1, new version use `table.unpack`
            local mode, keys, command, options, hint = unpack(item)
            vim.keymap.set(mode, keys, command, options)
            require('which-key').register({ [keys] = hint })
        end
    end
}
