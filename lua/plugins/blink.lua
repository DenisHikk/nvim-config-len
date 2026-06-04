return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"saghen/blink.lib"
		},
		build = function()
			require("blink.cmp").build():pwait()
		end,
		opts = {
			keymap = { preset = "default" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			}
		}
	}
}
