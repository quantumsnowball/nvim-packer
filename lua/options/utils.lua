-- refresh the config
vim.keymap.set('n', '<F7>', function()
    vim.cmd(':PackerCompile<cr>')
    vim.cmd(':LspRestart<cr>')
end)
