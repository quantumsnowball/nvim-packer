local use = require('packer').use

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
                    'filetype',
                    'encoding',
                    'fileformat',
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
