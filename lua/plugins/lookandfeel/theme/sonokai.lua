local use = require('packer').use

-- colorful editor theme
-- https://github.com/sainnhe/sonokai
use {
    'sainnhe/sonokai',
    config = function()
        -- enable the theme and choose the variant
        -- options:
        --   default, atlantis, andromeda, shusia, maia, espresso
        vim.g.sonokai_style = 'andromeda'
        -- vim.g.sonokai_better_performance = 1
        vim.cmd('colorscheme sonokai')
        -- toggle theme variants helper
        local current = 3
        local variants = {
            'default',
            'atlantis',
            'andromeda',
            'shusia',
            'maia',
            'espresso'
        }
        local map = require('utils').map
        map('n', '<F3>', function()
            local target = variants[math.fmod(current, 4) + 1]
            vim.g.sonokai_style = target
            vim.cmd('colorscheme sonokai')
            print(vim.inspect(target))
            current = current + 1
        end)
        require('which-key').register({ ['<F3>'] = 'toggle_colorscheme()' })
    end
}
