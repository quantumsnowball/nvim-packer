return function(lsp)
  -- lua
  if lsp == 'sumneko_lua' then
    return {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  end

  -- python
  -- run :PylspInstall pyls-flake8 first to put these settings to work
  if lsp == 'pylsp' then
    return {
      pylsp = {
        plugins = {
          flake8 = {
            enabled = true,
            ignore = { 'E501' },
          }
        }
      }
    }
  end
end
