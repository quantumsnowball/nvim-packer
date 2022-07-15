-- telescope keymaps
-- find files, including hidden
vim.keymap.set('n', '<leader>ff',
    '<cmd>lua require("telescope.builtin").find_files({layout_strategy="vertical", hidden=true})<cr>')
-- find words, including hidden
vim.keymap.set('n', '<leader>fg',
    '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical", additional_args=function(opts) return {"--hidden"} end})<cr>')
vim.keymap.set('n', '<leader>fw',
    '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical", additional_args=function(opts) return {"--hidden"} end})<cr>')
-- find recent files
vim.keymap.set('n', '<leader>fr',
    '<cmd>lua require("telescope.builtin").oldfiles({layout_strategy="vertical"})<cr>')
-- find buffers
vim.keymap.set('n', '<leader>fb',
    '<cmd>lua require("telescope.builtin").buffers({layout_strategy="vertical"})<cr>')
-- find helps
vim.keymap.set('n', '<leader>fh',
    '<cmd>lua require("telescope.builtin").help_tags({layout_strategy="vertical"})<cr>')
-- find files, ignore hidden files
vim.keymap.set('n', '<leader>fnf',
    '<cmd>lua require("telescope.builtin").find_files({layout_strategy="vertical"})<cr>')
-- find words, ignore hidden files
vim.keymap.set('n', '<leader>fng',
    '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical"})<cr>')
-- grep visual selected text directly
vim.keymap.set('v', '<leader>fs',
    '<cmd>lua require("telescope.builtin").grep_string({layout_strategy="vertical"})<cr>')
vim.keymap.set('v', '<leader>*',
    '<cmd>lua require("telescope.builtin").grep_string({layout_strategy="vertical"})<cr>')

-- which-key hints
require('which-key').register({
    ['<leader>f'] = {
        name = '+file',
        f = 'telescope.find_files',
        g = 'telescope.find_grep',
        w = 'telescope.find_grep',
        r = 'telescope.oldfiles',
        b = 'telescope.buffers',
        h = 'telescope.help_tags',
        n = {
            name = '+no-hidden',
            f = 'telescope.find_files.no_hidden',
            g = 'telescope.find_grep.no_hidden',
        },
        s = 'telescope.grep_string',
        ['*'] = 'telescope.grep_string'
    }
})
