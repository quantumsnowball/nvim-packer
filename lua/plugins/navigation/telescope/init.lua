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
            { 'n', '<leader>ff',
                '<cmd>lua require("telescope.builtin").find_files({layout_strategy="vertical", hidden=true})<cr>', {},
                'telescope.find_files()' },
            -- find words, including hidden
            { 'n', '<leader>fg',
                '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical", additional_args=function(opts) return {"--hidden"} end})<cr>',
                {},
                'telescope.live_grep()' },
            { 'n', '<leader>fw',
                '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical", additional_args=function(opts) return {"--hidden"} end})<cr>',
                {}, 'telescope.live_grep()' },
            -- find recent files
            { 'n', '<leader>fr',
                '<cmd>lua require("telescope.builtin").oldfiles({layout_strategy="vertical"})<cr>', {},
                'telescope.oldfiles()' },
            -- find buffers
            { 'n', '<leader>fb',
                '<cmd>lua require("telescope.builtin").buffers({layout_strategy="vertical"})<cr>', {},
                'telescope.buffers()' },
            -- find helps
            { 'n', '<leader>fh',
                '<cmd>lua require("telescope.builtin").help_tags({layout_strategy="vertical"})<cr>', {},
                'telescope.help_tags()' },
            -- find files, ignore hidden files
            { 'n', '<leader>fnf',
                '<cmd>lua require("telescope.builtin").find_files({layout_strategy="vertical"})<cr>', {},
                'telescope.find_files(--no-hidden)' },
            -- find words, ignore hidden files
            { 'n', '<leader>fng',
                '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical"})<cr>', {},
                'telescope.live_grep(--no-hidden)' },
            -- grep visual selected text directly
            { 'v', '<leader>fs',
                '<cmd>lua require("telescope.builtin").grep_string({layout_strategy="vertical"})<cr>', {},
                'telescope.grep_string(--visual-mode)' },
            { 'v', '<leader>*',
                '<cmd>lua require("telescope.builtin").grep_string({layout_strategy="vertical"})<cr>', {},
                'telescope.grep_string(--visual-mode)' },
        }) do
            -- unpack values
            -- -- neovim still using lua 5.1, new version use `table.unpack`
            -- local hint, mode, keys, command = unpack(item)
            local mode, keys, command, options, hint = unpack(item)
            -- register as vim key maps
            vim.keymap.set(mode, keys, command)
            -- register as which-key hints
            require('which-key').register({ [keys] = hint })
        end
    end
}

-- better quickfix list
require('plugins.navigation.telescope.bqf')
