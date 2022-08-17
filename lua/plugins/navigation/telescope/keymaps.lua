local tb = require('telescope.builtin')
local map = require('utils').map

-- general operation
map('n', '<leader>f.', tb.resume, {}, 'telescope.resume()')
map('n', '<leader>f/', tb.pickers, {}, 'telescope.pickers()')

-- find files
map('n', '<leader>ff', function() tb.find_files({ hidden = true }) end, {}, 'telescope.find_files()')
map('n', '<leader>fnf', tb.find_files, {}, 'telescope.find_files(--no-hidden)')
map('n', '<leader>faf', function() tb.find_files({ hidden = true, no_ignore = true }) end, {},
    'telescope.find_files(--everything)')

-- find words
map('n', '<leader>fw', function()
    tb.live_grep({ additional_args = function() return { "--hidden" } end })
end, {}, 'telescope.live_grep()')
map('n', '<leader>fnw', tb.live_grep, {}, 'telescope.live_grep(--no-hidden)')
map('n', '<leader>faw', function()
    tb.live_grep({ additional_args = function() return { "--hidden", "--no-ignore" } end })
end, {}, 'telescope.live_grep(--everything)')

-- find recent files
map('n', '<leader>fr', function()
    tb.oldfiles({ only_cwd = true })
end, {}, 'telescope.oldfiles()')

-- find buffers
map('n', '<leader>b', tb.buffers, {}, 'telescope.buffers()')
map('n', '<leader>fb', function()
    tb.buffers({ initial_mode = 'insert' })
end, {}, 'telescope.buffers()')

-- find tabpages
map('n', '<leader>t', tb.tabpages, {}, 'telescope.tabpages()')

-- find helps
map('n', '<leader>fh', tb.help_tags, {}, 'telescope.help_tags()')

-- find jumplist
map('n', '<leader>fj', tb.jumplist, {}, 'telescope.jumplist()')

-- grep visual selected text directly
map('v', '<leader>fs', tb.grep_string, {}, 'telescope.grep_string(--visual-mode)')
map('v', '<leader>*', tb.grep_string, {}, 'telescope.grep_string(--visual-mode)')

-- color scheme
map('n', '<leader>fcs', tb.colorscheme, {}, 'telescope.colorscheme()')

-- git navigation
map('n', '<leader>gc', tb.git_commits, {}, 'telescope.git_commits()')
map('n', '<leader>gbc', tb.git_bcommits, {}, 'telescope.git_bcommits()')
map('n', '<leader>gd', tb.git_status, {}, 'telescope.git_status()')

-- vim commands
map('n', '<leader>f;', tb.command_history, {}, 'telescope.command_history()')
map('n', '<leader>fch', tb.command_history, {}, 'telescope.command_history()')
map('n', '<leader>fcc', tb.commands, {}, 'telescope.command_custom()')

-- vim autocmds
map('n', '<leader>fac', tb.autocommands, {}, 'telescope.autocommand()')

-- lsp
map('n', '<leader>fv', tb.lsp_references, {}, 'telescope.lsp_references()')
map('n', '<leader>fe', tb.diagnostics, {}, 'telescope.diagnostics()')
map('n', '<leader>fca', vim.lsp.buf.code_action, {}, 'telescope.code_action()')
map('n', 'gd', tb.lsp_definitions, {}, 'telescope.lsp_definitions()')

-- highlights
map('n', '<leader>fi', tb.highlights, {}, 'telescope.highlights()')

-- spell
map('n', '<leader>ft', tb.spell_suggest, {}, 'telescope.spell_suggest()')

-- keymaps
map('n', '<leader>fk', tb.keymaps, {}, 'telescope.keymaps()')

-- fzf current buffer
map('n', '<leader>fz', tb.current_buffer_fuzzy_find, {}, 'telescope.current_buffer_fuzzy_find()')

-- treesitter objects
map('n', '<leader>fm', tb.treesitter, {}, 'telescope.treesitter()')

-- registers
map('n', '<leader>f"', tb.registers, {}, 'telescope.registers()')

-- marks
map('n', '<leader>f\'', tb.marks, {}, 'telescope.marks()')

-- list all telescop.builtin functions
map('n', '<leader>fp', tb.builtin, {}, 'telescope.builtin()')

--------------------
-- other keymspas --
--------------------
map('n', 'qfo', ':copen<cr>')
map('n', 'qfc', ':cclose<cr>')
map('n', 'qfj', ':cnext<cr>')
map('n', 'qfk', ':cprev<cr>')
