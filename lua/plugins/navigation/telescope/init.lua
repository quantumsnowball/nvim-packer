local use = require('packer').use

use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup {
            defaults = {
                layout_config = { vertical = { width = 0.8 } }
            },
            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
                },
            }
        }
        -- telescope keymaps
        for _, item in pairs({
            { 'telescope.find_files()', 'n', '<leader>ff',
                '<cmd>lua require("telescope.builtin").find_files({layout_strategy="vertical", hidden=true})<cr>' },
            -- find words, including hidden
            { 'telescope.live_grep()', 'n', '<leader>fg',
                '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical", additional_args=function(opts) return {"--hidden"} end})<cr>' },
            { 'telescope.live_grep()', 'n', '<leader>fw',
                '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical", additional_args=function(opts) return {"--hidden"} end})<cr>' },
            -- find recent files
            { 'telescope.oldfiles()', 'n', '<leader>fr',
                '<cmd>lua require("telescope.builtin").oldfiles({layout_strategy="vertical"})<cr>' },
            -- find buffers
            { 'telescope.buffers()', 'n', '<leader>fb',
                '<cmd>lua require("telescope.builtin").buffers({layout_strategy="vertical"})<cr>' },
            -- find helps
            { 'telescope.help_tags()', 'n', '<leader>fh',
                '<cmd>lua require("telescope.builtin").help_tags({layout_strategy="vertical"})<cr>' },
            -- find files, ignore hidden files
            { 'telescope.find_files(--no-hidden)', 'n', '<leader>fnf',
                '<cmd>lua require("telescope.builtin").find_files({layout_strategy="vertical"})<cr>' },
            -- find words, ignore hidden files
            { 'telescope.live_grep(--no-hidden)', 'n', '<leader>fng',
                '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical"})<cr>' },
            -- grep visual selected text directly
            { 'telescope.grep_string(--visual-mode)', 'v', '<leader>fs',
                '<cmd>lua require("telescope.builtin").grep_string({layout_strategy="vertical"})<cr>' },
            { 'telescope.grep_string(--visual-mode)', 'v', '<leader>*',
                '<cmd>lua require("telescope.builtin").grep_string({layout_strategy="vertical"})<cr>' },
        }) do
            -- unpack values
            -- -- neovim still using lua 5.1, new version use `table.unpack`
            local hint, mode, keys, command = unpack(item)
            -- register as vim key maps
            vim.keymap.set(mode, keys, command)
            -- register as which-key hints
            require('which-key').register({ [keys] = hint })
        end
    end
}

-- better quickfix list
require('plugins.navigation.telescope.bqf')
