local use = require('packer').use

-- Alpha
-- https://github.com/goolord/alpha-nvim
use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        -- Set header
        dashboard.section.header.val = {
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },
            dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  > Recent",
                '<cmd>lua require("telescope.builtin").oldfiles({layout_strategy="vertical"})<cr>'),
            dashboard.button("f", "  > Find file",
                '<cmd>lua require("telescope.builtin").find_files({layout_strategy="vertical", hidden=true})<cr>'),
            dashboard.button("w", "  > Find Word",
                '<cmd>lua require("telescope.builtin").live_grep({layout_strategy="vertical", additional_args=function(opts) return {"--hidden"} end})<cr>'),
            -- dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            -- dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
        }
        -- Send config to alpha
        require('alpha').setup(dashboard.opts)
    end
}
