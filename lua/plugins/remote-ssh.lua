return {
	{
		"amitds1997/remote-nvim.nvim",
		build = "cargo build --release",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	}
}
