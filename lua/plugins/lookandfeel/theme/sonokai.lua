local use = require('packer').use

-- colorful editor theme
-- https://github.com/sainnhe/sonokai
use {
    'sainnhe/sonokai',
    config = function()
        -- enable the theme and choose the variant
        -- options:
        --   default, atlantis, andromeda, shusia, maia, espresso
        vim.g.sonokai_style = 'atlantis'
        -- vim.g.sonokai_better_performance = 1
        vim.cmd('colorscheme sonokai')
        -- code after theme load
        require('plugins.lookandfeel.theme.after')
    end
}
