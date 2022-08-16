local use = require('packer').use

-- easy multiple line jumping
-- https://github.com/easymotion/vim-easymotion
-- use 'easymotion/vim-easymotion'

-- type the word to jump
-- https://github.com/ggandor/lightspeed.nvim
-- use 'ggandor/lightspeed.nvim'

-- lightspeed successor
-- https://github.com/ggandor/leap.nvim
use {
    'ggandor/leap.nvim',
    config = function()
        require('leap').set_default_keymaps()
        require('leap').setup {
            special_keys = {
                repeat_search = '<tab>',
                next_match = '<tab>',
                prev_match = '<s-tab>',
                next_group = ']',
                prev_group = '['
            }
        }
    end
}
