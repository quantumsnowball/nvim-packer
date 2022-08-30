local M = {}

M.ensure_installed = function()
    -- ensure installed
    require("nvim-lsp-installer").setup {
        ensure_installed = require('plugins.completion.lsp.installer.servers'),
        automatic_installation = true,
    }
end

return M
