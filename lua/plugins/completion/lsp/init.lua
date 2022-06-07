local use = require('packer').use

-- LSP installer
-- https://github.com/williamboman/nvim-lsp-installer
use {
  'williamboman/nvim-lsp-installer',
  requires = 'neovim/nvim-lspconfig',
  config = function()
    local servers = require('plugins.completion.lsp.servers')
    -- ensure installed
    require("nvim-lsp-installer").setup{
      ensure_installed = servers,
      automatic_installation = true,
    }
  end
}
