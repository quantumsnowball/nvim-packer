-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
for _, item in pairs({
    { 'diagnostic.open_float()', 'n', '<space>e', vim.diagnostic.open_float, opts },
    { 'diagnostic.goto_prev()', 'n', '[d', vim.diagnostic.goto_prev, opts },
    { 'diagnostic.goto_next()', 'n', ']d', vim.diagnostic.goto_next, opts },
    { 'diagnostic.setloclist()', 'n', '<space>q', vim.diagnostic.setloclist, opts }
}) do
    -- unpack values
    -- -- neovim still using lua 5.1, new version use `table.unpack`
    local hint, mode, keys, command = unpack(item)
    -- register as vim key maps
    vim.keymap.set(mode, keys, command)
    -- register as which-key hints
    require('which-key').register({ [keys] = hint })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    for _, item in pairs({
        { 'lsp.buf.declaration()', 'n', 'gD', vim.lsp.buf.declaration, bufopts },
        { 'lsp.buf.definition()', 'n', 'gd', vim.lsp.buf.definition, bufopts },
        -- { 'lsp.buf.hover()', 'n', 'K', vim.lsp.buf.hover, bufopts },
        { 'lsp.buf.implementation()', 'n', 'gi', vim.lsp.buf.implementation, bufopts },
        -- { 'lsp.buf.signature_help()', 'n', 'gk', vim.lsp.buf.signature_help, bufopts },
        { 'lsp.buf.add_workspace_folder()', 'n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts },
        { 'lsp.buf.remove_workspace_folder()', 'n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts },
        { 'lsp.buf.list_workspace_folders()', 'n', '<space>wl',
            function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts },
        { 'lsp.buf.type_definition()', 'n', '<space>D', vim.lsp.buf.type_definition, bufopts },
        -- { 'lsp.buf.rename()', 'n', '<space>rn', vim.lsp.buf.rename, bufopts },
        { 'lsp.buf.code_action()', 'n', '<space>qf', vim.lsp.buf.code_action, bufopts },
        { 'lsp.buf.references()', 'n', 'gr', vim.lsp.buf.references, bufopts },
        { 'lsp.buf.formatting()', 'n', '<space>f', vim.lsp.buf.formatting, bufopts },
        { 'lsp.buf.formatting()', 'n', '<leader>fd', vim.lsp.buf.formatting, bufopts }
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
