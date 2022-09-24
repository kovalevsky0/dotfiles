-- Settings for Neovim built-in LSP clinet: https://github.com/sumneko/lua-language-server/wiki/Setting#neovim-with-built-in-lsp-client

return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
