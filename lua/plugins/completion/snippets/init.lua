local use = require('packer').use

-- vscode js/ts/react snippets
-- https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets
use {
    'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
}
-- note:
-- LuaSnip commit:
-- e2a044f8fa4d8b86b63b4494c257bb1aa7379c97
-- seems to be the root cause of a bug when call this snippets
--
-- LuaSnip/lua/luasnip/nodes/snippet.lua:764: attempt to concatenate a nil value
--
-- the commit on master branch right before it is:
-- 79b2019c68a2ff5ae4d732d50746c901dd45603a
-- temporarily revert back to this commit in packer fixed the problem
