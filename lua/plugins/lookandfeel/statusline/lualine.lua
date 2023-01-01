local use = require('packer').use


-- lsp-status
-- https://github.com/nvim-lua/lsp-status.nvim#configuration
use {
    'nvim-lua/lsp-status.nvim',
    config = function()
        require('lsp-status').config({
            -- this is temp fix for a wrong line spacing that breaks lualine
            status_symbol = 'LSP'
        })
    end
}

-- lualine
-- https://github.com/nvim-lualine/lualine.nvim
use {
    'nvim-lualine/lualine.nvim',
    requires = {
        { 'kyazdani42/nvim-web-devicons', opt = true },
        'nvim-lua/lsp-status.nvim'
    },
    config = function()
        require('lualine').setup {
            options = {
                -- Gallery
                -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
                theme = 'powerline_dark',
                disabled_filetypes = { 'packer', 'NvimTree', 'Outline' },
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
            },
            sections = {
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = {
                    function() return require('lsp-status').status() end,
                },
                lualine_y = {
                    'filetype',
                    'encoding',
                    'fileformat',
                },
                lualine_z = {
                    'location',
                    'progress',
                },
            },
            inactive_sections = {
                lualine_c = { { 'filename', path = 1 } }
            }
        }
        -- disable the original mode indicator
        vim.opt.showmode = false
    end
}
