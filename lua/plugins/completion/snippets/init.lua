local use = require('packer').use

-- vscode js/ts/react snippets
-- https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets
use {
    'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
}
-- emmet
-- https://github.com/aca/emmet-ls
use {
    'aca/emmet-ls',
    config = function()
        -- ensure installed
        require('plugins.completion.lsp.installer.utils').ensure_installed()
        -- attach snippets
        local lspconfig = require('lspconfig')
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        lspconfig.emmet_ls.setup({
            -- on_attach = on_attach,
            capabilities = capabilities,
            filetypes = {
                'html', 'typescriptreact', 'javascriptreact',
                'css', 'sass', 'scss', 'less'
            },
        })
        -- since this lsp is not list in LspInstaller,
        -- needs to run :LspInstall emmet-ls when run for the first time
    end
}
