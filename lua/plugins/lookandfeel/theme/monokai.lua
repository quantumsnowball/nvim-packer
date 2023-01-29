local use = require('packer').use

-- colorful editor theme
-- https://github.com/tanvirtin/monokai.nvim
-- https://github.com/quantumsnowball/monokai.nvim
use {
    -- 'tanvirtin/monokai.nvim',
    'quantumsnowball/monokai.nvim',
    branch = 'my-color',
    config = function()
        -- enable
        vim.cmd 'colorscheme monokai_ristretto'
        -- toggle theme variants
        local current = 0
        local variants = {
            'monokai',
            'monokai_pro',
            'monokai_ristretto',
            'monokai_soda',
        }
        local map = require('utils').map
        map('n', '<F3>', function()
            local target = variants[math.fmod(current, 4) + 1]
            vim.cmd('colorscheme ' .. target)
            print(vim.inspect(target))
            current = current + 1
        end)
        require('which-key').register({ ['<F3>'] = 'toggle_colorscheme()' })
    end
}
