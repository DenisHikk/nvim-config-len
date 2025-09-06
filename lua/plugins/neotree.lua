vim.cmd([[ let g:neo_tree_remove_legacy_command = 1 ]])

-- if you want icons for diagnostic errors
-- vim.fn.sign_define("DiagnosticSignError", {
--	text = "", texthl = "DiagnosticSignError"
-- })

require("neo-tree").setup {
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false
		}
	}
}
