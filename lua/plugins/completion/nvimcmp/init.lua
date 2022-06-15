local use = require('packer').use

-- completion engine written in lua
-- https://github.com/hrsh7th/nvim-cmp
use {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'f3fora/cmp-spell',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      view = { entries = { name = 'custom', selection_order = 'near_cursor' } },
      experimental = { ghost_text = false, },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          local kind_icons = require('plugins.completion.nvimcmp.kind_icons')
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          vim_item.menu = (require('plugins.completion.nvimcmp.menu_items'))[entry.source.name]
          return vim_item
        end
      },
      mapping = require('plugins.completion.nvimcmp.keymaps')(cmp, luasnip),
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = "buffer" },
        { name = "path" },
        { name = "spell" },
      },
    })
  end
}
-- enable nvim-cmp to use lsp server
-- https://github.com/hrsh7th/cmp-nvim-lsp
use {
  'hrsh7th/cmp-nvim-lsp',
  requires = 'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')
    local servers = require('plugins.completion.lsp.servers')
    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    for _, lsp in pairs(servers) do
      local args = { capabilities = capabilities }
      -- lua
      if lsp == 'sumneko_lua' then
        -- print('Special init: ' .. lsp) -- debug
        args.settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
      end
      -- python
      -- run :PylspInstall pyls-flake8 first to put these settings to work
      if lsp == 'pylsp' then
        args.settings = {
          pylsp = {
            plugins = {
              flake8 = {
                enabled = true,
                ignore = { 'E501' },
              }
            }
          }
        }
      end
      -- add shortcut for lsp services
      args.on_attach = require('plugins.completion.lsp.keymaps')
      -- print('Normal init: ' .. lsp) -- debug
      lspconfig[lsp].setup(args)
    end
  end
}
-- luasnip snippet engine
-- https://github.com/L3MON4D3/LuaSnip
use {
  'L3MON4D3/LuaSnip',
  requires = {
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets'
  },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
  end
}
-- spell checking server
-- https://github.com/f3fora/cmp-spell
use {
  'f3fora/cmp-spell',
  config = function()
    vim.opt.spell = true
    vim.opt.spelllang = { 'en_us' }
  end
}
-- lsp signature
-- https://github.com/ray-x/lsp_signature.nvim
use {
  'ray-x/lsp_signature.nvim',
  config = function()
    -- require('lspconfig').gopls.setup()
    require('lsp_signature').setup {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = 'rounded' -- double, rounded, single, shadow, none
      },
      timer_interval = 100, -- default timer check interval set to lower value if you want to reduce latency
      toggle_key = '<C-s>' -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    }
  end
}
