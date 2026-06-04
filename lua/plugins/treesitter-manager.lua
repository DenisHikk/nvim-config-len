return {
	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {}, -- tree-sitter CLI должен быть установлен системно
		config = function()
			require("tree-sitter-manager").setup({
			ensure_installed = { "lua", "vim", "vimdoc", "bash", "python", "go" },
			auto_install = true,
		})
	end,
	},
}
