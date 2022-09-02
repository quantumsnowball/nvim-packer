local map = require('utils').map
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
-- map( 'n', '<space>e', vim.diagnostic.open_float, opts, 'diagnostic.open_float()' )
-- map( 'n', '( d', vim.diagnostic.goto_prev, opts, 'diagnostic.goto_prev()')
-- map( 'n', ' )d', vim.diagnostic.goto_next, opts, 'diagnostic.goto_next()' )
map('n', '<space>qe', vim.diagnostic.setloclist, opts, 'diagnostic.setloclist()')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    map('n', 'gD', vim.lsp.buf.declaration, bufopts, 'lsp.buf.declaration()')
    -- map( 'n', 'gd', vim.lsp.buf.definition, bufopts, 'lsp.buf.definition()' ),
    -- map( 'n', 'K', vim.lsp.buf.hover, bufopts, 'lsp.buf.hover()' ),
    map('n', 'gi', vim.lsp.buf.implementation, bufopts, 'lsp.buf.implementation()')
    map('n', 'zk', vim.lsp.buf.signature_help, bufopts, 'lsp.buf.signature_help()')
    map('i', '<C-k>', vim.lsp.buf.signature_help, bufopts, 'lsp.buf.signature_help()')
    map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts, 'lsp.buf.add_workspace_folder()')
    map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, 'lsp.buf.remove_workspace_folder()')
    map('n', '<space>wl',
        function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts,
        'lsp.buf.list_workspace_folders()')
    map('n', '<space>D', vim.lsp.buf.type_definition, bufopts, 'lsp.buf.type_definition()')
    map('n', '<space>rn', vim.lsp.buf.rename, bufopts, 'lsp.buf.rename()')
    map('n', '<space>qf', vim.lsp.buf.code_action, bufopts, 'lsp.buf.code_action()')
    map('n', 'gr', vim.lsp.buf.references, bufopts, 'lsp.buf.references()')
    map('n', '<space>f', vim.lsp.buf.format, bufopts, 'lsp.buf.formatting()')
    map('n', '<leader>fd', vim.lsp.buf.format, bufopts, 'lsp.buf.formatting()')
end
