-- before loading any lua scripts
require('options.configs')
require('options.keymaps')
require('options.utils')

-- packer bootstrapping setup
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

-- startup with packer
return require('packer').startup(function(use)
    -- cache plugins loading enable
    require('plugins.cache')
    -- packer loading itself at beginning
    -- https://github.com/wbthomason/packer.nvim
    use { "wbthomason/packer.nvim" }
    -- loading individual plugin modules
    require('plugins.completion')
    require('plugins.lookandfeel')
    require('plugins.navigation')
    require('plugins.editing')
    require('plugins.highlight')
    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then require('packer').sync() end -- Put this after all plugins
end)
