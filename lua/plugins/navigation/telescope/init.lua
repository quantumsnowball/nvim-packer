local use = require('packer').use

use {
    'nvim-telescope/telescope.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function()
        require('telescope').setup {
            defaults = {
                layout_config = { vertical = { width = 0.85 } },
                scroll_strategy = 'limit'
            },
            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({})
                }
            }
        }
        require("telescope").load_extension("ui-select")
        -- telescope keymaps
        local tb = require('telescope.builtin')
        local vlayout = { layout_strategy = "vertical" }
        for _, item in pairs({
            { 'n', '<leader>ff',
                function()
                    tb.find_files({ layout_strategy = "vertical", hidden = true })
                end, {}, 'telescope.find_files()' },
            -- find words, including hidden
            { 'n', '<leader>fw',
                function()
                    tb.live_grep({ layout_strategy = "vertical",
                        additional_args = function() return { "--hidden" } end })
                end, {}, 'telescope.live_grep()' },
            -- find recent files
            { 'n', '<leader>fr', function() tb.oldfiles(vlayout) end, {}, 'telescope.oldfiles()' },
            -- find buffers
            { 'n', '<leader>fb', function() tb.buffers(vlayout) end, {}, 'telescope.buffers()' },
            -- find helps
            { 'n', '<leader>fh', function() tb.help_tags(vlayout) end, {}, 'telescope.help_tags()' },
            -- find files, ignore hidden files
            { 'n', '<leader>fnf', function() tb.find_files(vlayout) end, {}, 'telescope.find_files(--no-hidden)' },
            -- find words, ignore hidden files
            { 'n', '<leader>fnw', function() tb.live_grep(vlayout) end, {}, 'telescope.live_grep(--no-hidden)' },
            -- grep visual selected text directly
            { 'v', '<leader>fs', function() tb.grep_string(vlayout) end, {}, 'telescope.grep_string(--visual-mode)' },
            { 'v', '<leader>*', function() tb.grep_string(vlayout) end, {}, 'telescope.grep_string(--visual-mode)' },
            -- color scheme
            { 'n', '<leader>fcs', function() tb.colorscheme(vlayout) end, {}, 'telescope.colorscheme()' },
            -- git navigation
            { 'n', '<leader>gc', function() tb.git_commits(vlayout) end, {}, 'telescope.git_commits()' },
            { 'n', '<leader>gbc', function() tb.git_bcommits(vlayout) end, {}, 'telescope.git_bcommits()' },
            { 'n', '<leader>gd', function() tb.git_status(vlayout) end, {}, 'telescope.git_status()' },
            -- vim commands
            { 'n', '<leader>f;', function() tb.command_history(vlayout) end, {}, 'telescope.command_history()' },
            { 'n', '<leader>fch', function() tb.command_history(vlayout) end, {}, 'telescope.command_history()' },
            { 'n', '<leader>fcc', function() tb.commands(vlayout) end, {}, 'telescope.command_custom()' },
            -- lsp
            { 'n', '<leader>fv', function() tb.lsp_references(vlayout) end, {}, 'telescope.lsp_references()' },
            { 'n', '<leader>fp', function() tb.diagnostics(vlayout) end, {}, 'telescope.diagnostics()' },
            -- spell
            { 'n', '<leader>ft', function() tb.spell_suggest(vlayout) end, {}, 'telescope.spell_suggest()' },
            -- keymaps
            { 'n', '<leader>fk', function() tb.keymaps(vlayout) end, {}, 'telescope.keymaps()' },
        }) do
            local mode, keys, command, options, hint = unpack(item)
            require('utils').map(mode, keys, command, options, hint)
        end
    end
}

-- better quickfix list
require('plugins.navigation.telescope.bqf')
