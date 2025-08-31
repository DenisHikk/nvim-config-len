require("mason").setup({
	ensure_installed = {
		-- Python
		"pyright", 
		-- JavaScript
		"eslint_d",
		-- LUA
		"lua_language_server",
		-- prettierd
		"prettierd",
		-- typescript
		"typescript-language-server"
	},
	automatic_installation = true
})
