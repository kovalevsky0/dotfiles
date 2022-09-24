-- checks that nvim-lsp-installer is installed and available
-- if not then exit from file
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local table_extend = vim.tbl_deep_extend

-- more information here: https://github.com/williamboman/nvim-lsp-installer/#setup

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = require('main.lsp.handlers').on_attach,
      capabilities = require('main.lsp.handlers').capabilities,
    }

    -- sumneko_lua: Lua Language Server (https://github.com/sumneko/lua-language-server)
    if server.name == "sumneko_lua" then
      local sumneko_settings = require('main.lsp.settings.sumneko_lua')
      opts = table_extend('force', sumneko_settings, opts)
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

