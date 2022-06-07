local use = require('packer').use

-- cache all plugins to speed up loading time
-- https://github.com/lewis6991/impatient.nvim
use {
  'lewis6991/impatient.nvim',
  config = function() require('impatient') end
}
