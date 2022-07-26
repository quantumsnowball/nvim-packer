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
        local tb = require('telescope.builtin')
        for _, item in pairs({
            { 'n', '<leader>ff',
                function()
                    tb.find_files({ layout_strategy = "vertical", hidden = true })
                end, {}, 'telescope.find_files()' },
            -- find words, including hidden
            { 'n', '<leader>fg',
                function()
                    tb.live_grep({ layout_strategy = "vertical",
                        additional_args = function() return { "--hidden" } end })
                end, {}, 'telescope.live_grep()' },
            { 'n', '<leader>fw',
                function()
                    tb.live_grep({ layout_strategy = "vertical",
                        additional_args = function() return { "--hidden" } end })
                end, {}, 'telescope.live_grep()' },
            -- find recent files
            { 'n', '<leader>fr',
                function()
                    tb.oldfiles({ layout_strategy = "vertical" })
                end, {}, 'telescope.oldfiles()' },
            -- find buffers
            { 'n', '<leader>fb',
                function()
                    tb.buffers({ layout_strategy = "vertical" })
                end, {}, 'telescope.buffers()' },
            -- find helps
            { 'n', '<leader>fh',
                function()
                    tb.help_tags({ layout_strategy = "vertical" })
                end, {}, 'telescope.help_tags()' },
            -- find files, ignore hidden files
            { 'n', '<leader>fnf',
                function()
                    tb.find_files({ layout_strategy = "vertical" })
                end, {}, 'telescope.find_files(--no-hidden)' },
            -- find words, ignore hidden files
            { 'n', '<leader>fng',
                function()
                    tb.live_grep({ layout_strategy = "vertical" })
                end, {}, 'telescope.live_grep(--no-hidden)' },
            -- grep visual selected text directly
            { 'v', '<leader>fs',
                function()
                    tb.grep_string({ layout_strategy = "vertical" })
                end, {}, 'telescope.grep_string(--visual-mode)' },
            { 'v', '<leader>*',
                function()
                    tb.grep_string({ layout_strategy = "vertical" })
                end, {}, 'telescope.grep_string(--visual-mode)' },
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
