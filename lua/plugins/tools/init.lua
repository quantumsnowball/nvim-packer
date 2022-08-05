local use = require('packer').use


-- rest client
-- original
-- https://github.com/NTBBloodbath/rest.nvim
-- my bug fixed fork
-- https://github.com/quantumsnowball/rest.nvim
use {
    "quantumsnowball/rest.nvim",
    branch = 'fix',
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
        require("rest-nvim").setup({
            -- Open request results in a horizontal split
            result_split_horizontal = false,
            -- Keep the http file buffer above|left when split horizontal|vertical
            result_split_in_place = true,
            -- Skip SSL verification, useful for unknown certificates
            skip_ssl_verification = false,
            -- Highlight request on run
            highlight = {
                enabled = true,
                timeout = 150,
            },
            result = {
                -- toggle showing URL, HTTP info, headers at top the of result window
                show_url = true,
                show_http_info = true,
                show_headers = true,
            },
            -- Jump to request line on run
            jump_to_request = false,
            env_file = '.env',
            custom_dynamic_variables = {},
            yank_dry_run = true,
        })
        -- keymaps
        vim.keymap.set('n', '<leader>rr', '<Plug>RestNvim')
        vim.keymap.set('n', '<leader>rp', '<Plug>RestNvimPreview')
        vim.keymap.set('n', '<leader>ra', '<Plug>RestNvimLast')
        -- usage
        -- e.g.
        -- GET https://reqres.in/api/users?page=5
        -- P.S. you must save the file as .http extension
        -- P.S. also need to install `jq` binary, the json cli parser
    end
}
