local use = require('packer').use

use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
        -- may need to manually run `:CocInstall coc-explorer` to install
        -- vim.cmd ':CocInstall coc-explorer'
        -- keymaps
        vim.keymap.set('n', '<leader>e', ':CocCommand explorer<CR>')
    end
}

--------------------------------------
-- copy the following table to -------
-- ~/.config/nvim/coc-settings.json --
--------------------------------------
--[[

{
  "explorer.width": 25,
  "explorer.sources": [
    {
      "name": "buffer",
      "expand": true
    },
    {
      "name": "file",
      "expand": true
    }
  ],
  "explorer.keyMappings.global": {
    "x": "cutFile",
    "dd": "delete",
    "<tab>": "toggleSelection",
    "L": [
      "expandable?",
      ["expanded?", "cd", "expand"],
      ["collapse", "cd"]
    ]
  },
  "explorer.presets": {
    "floating": {
      "position": "floating",
      "open-action-strategy": "sourceWindow"
    }
  },
  "explorer.icon.enableNerdfont": true,
  "explorer.buffer.tabOnly": true,
  "explorer.file.reveal.whenOpen": false,
  "explorer.file.reveal.filter": {
    "literals": ["node_modules"]
  },
  "explorer.mouseMode": "singleclick",
  "explorer.debug": true
}

--]]
