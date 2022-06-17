local use = require('packer').use

-- colorful editor theme
-- https://github.com/tanvirtin/monokai.nvim
use {
    'tanvirtin/monokai.nvim',
    config = function()
        -- enable
        vim.cmd 'colorscheme monokai_ristretto'
        -- post theme
        require('plugins.lookandfeel.theme.after')
        -- toggle theme variants
        local current = 0
        local variants = {
            'monokai',
            'monokai_pro',
            'monokai_ristretto',
            'monokai_soda',
        }
        vim.keymap.set('n', '<F3>', function()
            local target = variants[math.fmod(current, 4) + 1]
            vim.cmd('colorscheme ' .. target)
            print(vim.inspect(target))
            current = current + 1
        end)
    end
}
