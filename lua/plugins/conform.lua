require("conform").setup({
	formatters_by_ft = {
		javascript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
    	typescript = { "eslint_d" },
    	typescriptreact = { "eslint_d" },
    	vue = { "eslint_d" },
    	json = { "eslint_d" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true
	}
})
