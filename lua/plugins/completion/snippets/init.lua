local use = require('packer').use

-- vscode js/ts/react snippets
-- https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets
use {
    'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
}
