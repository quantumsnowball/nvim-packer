local tb = require('telescope.builtin')

local M = {}

M.keymaps = {
    { 'n', '<leader>ff', function()
        tb.find_files({ hidden = true })
    end, {}, 'telescope.find_files()' },
    -- find words, including hidden
    { 'n', '<leader>fw', function()
        tb.live_grep({ additional_args = function() return { "--hidden" } end })
    end, {}, 'telescope.live_grep()' },
    -- find recent files
    { 'n', '<leader>fr', tb.oldfiles, {}, 'telescope.oldfiles()' },
    -- find buffers
    { 'n', '<leader>fb', tb.buffers, {}, 'telescope.buffers()' },
    -- find helps
    { 'n', '<leader>fh', tb.help_tags, {}, 'telescope.help_tags()' },
    -- find files, ignore hidden files
    { 'n', '<leader>fnf', tb.find_files, {}, 'telescope.find_files(--no-hidden)' },
    -- find words, ignore hidden files
    { 'n', '<leader>fnw', tb.live_grep, {}, 'telescope.live_grep(--no-hidden)' },
    -- grep visual selected text directly
    { 'v', '<leader>fs', tb.grep_string, {}, 'telescope.grep_string(--visual-mode)' },
    { 'v', '<leader>*', tb.grep_string, {}, 'telescope.grep_string(--visual-mode)' },
    -- color scheme
    { 'n', '<leader>fcs', tb.colorscheme, {}, 'telescope.colorscheme()' },
    -- git navigation
    { 'n', '<leader>gc', tb.git_commits, {}, 'telescope.git_commits()' },
    { 'n', '<leader>gbc', tb.git_bcommits, {}, 'telescope.git_bcommits()' },
    { 'n', '<leader>gd', tb.git_status, {}, 'telescope.git_status()' },
    -- vim commands
    { 'n', '<leader>f;', tb.command_history, {}, 'telescope.command_history()' },
    { 'n', '<leader>fch', tb.command_history, {}, 'telescope.command_history()' },
    { 'n', '<leader>fcc', tb.commands, {}, 'telescope.command_custom()' },
    -- lsp
    { 'n', '<leader>fv', tb.lsp_references, {}, 'telescope.lsp_references()' },
    { 'n', '<leader>fe', tb.diagnostics, {}, 'telescope.diagnostics()' },
    { 'n', '<leader>fca', vim.lsp.buf.code_action, {}, 'telescope.code_action()' },
    -- spell
    { 'n', '<leader>ft', tb.spell_suggest, {}, 'telescope.spell_suggest()' },
    -- keymaps
    { 'n', '<leader>fk', tb.keymaps, {}, 'telescope.keymaps()' },
    -- fzf current buffer
    { 'n', '<leader>fz', tb.current_buffer_fuzzy_find, {}, 'telescope.current_buffer_fuzzy_find()' },
    -- treesitter objects
    { 'n', '<leader>fm', tb.treesitter, {}, 'telescope.treesitter()' },
}

return M
