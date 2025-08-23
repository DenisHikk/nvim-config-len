require'nvim-treesitter.configs'.setup {
	ensure_installed = {"lua", "markdown", "javascript", "python", "html", "css", "typescript"},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true
	}
}
