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
