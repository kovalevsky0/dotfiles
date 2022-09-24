ls = require "luasnip"
types = require "luasnip.util.types"

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end

-- reload config command:
-- source ~/.config/nvim/lua/main/configs/luasnip.lua

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jumk back into it even if you move outside of selection.
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" }},
      }
    }
  }
}


-- create snippet

--[[
ls.snippets = {
  all = {
    -- Available in any filetype
    ls.parser.parser_snippet("expand", "-- this is what was expanded"),
  },

  lua = {
    -- Lua specific snippets
  }
}
]]--
