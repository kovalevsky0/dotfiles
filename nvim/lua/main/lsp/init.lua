-- checks that lspconfig is installed and available
-- if not then exit from file
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local lang_servers = require("main.lsp.lang_servers")
local on_lang_server_attach = require("main.lsp.on_lang_server_attach")

-- it's Stateless Iterator
-- see Lua documentation: https://www.lua.org/pil/7.3.html
for _, server_name in ipairs(lang_servers) do
  lspconfig[server_name].setup {
    on_attach = on_lang_server_attach
  }
end


