local use = require('packer').use

-- syntax highlighting
-- https://github.com/nvim-treesitter/nvim-treesitter
use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup{
      highlight = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
      indent = { enable = false }
    }
    -- enable code folding
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt.foldlevel = 10
  end
}
-- indentation line guides
-- https://github.com/lukas-reineke/indent-blankline.nvim
use {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    -- show space and end-of-line
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")
    require("indent_blankline").setup{
      show_end_of_line = true,
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    }
    -- wrapped lines follow indentation
    vim.opt.breakindent = true
  end
}
-- smart detect document indentation
-- https://github.com/Darazaki/indent-o-matic
use {
  'Darazaki/indent-o-matic',
  config = function()
    -- default neovim tabsize to 4 space
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 0 -- match with tabstop
    vim.opt.expandtab = true -- use space instead of tab char
    -- specific file types to use tabsize of 2 space
    -- TODO
    -- only tabsize of 2 or 4 are necessary
    -- then vim will follow the current tabsize of document
    require('indent-o-matic').setup{
      standard_widths = { 2, 4 },
    }
  end
}
-- display color code on background
-- https://github.com/norcalli/nvim-colorizer.lua
use {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup{
      '*'; -- Highlight all files, but customize some others.
      css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
      html = { names = false; } -- Disable parsing "names" like Blue or Gray
    }
  end
}
-- colorize bracket pairsk
-- https://github.com/p00f/nvim-ts-rainbow.git
use {
  'p00f/nvim-ts-rainbow',
  config = function()
    require("nvim-treesitter.configs").setup {
      highlight = { },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      }
    }
  end
}
