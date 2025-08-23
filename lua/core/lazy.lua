-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  	if vim.v.shell_error ~= 0 then
    	vim.api.nvim_echo({
      		{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      		{ out, "WarningMsg" },
      		{ "\nPress any key to exit..." },
    	}, true, {})
    	vim.fn.getchar()
    	os.exit(1)
  	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "

-- Setup lazy.nvim
require("lazy").setup({
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
      		"MunifTanjim/nui.nvim",
      		"nvim-tree/nvim-web-devicons", -- optional, but recommended
		}
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate"
	},
	{"neovim/nvim-lspconfig"},
	{"neovim/nvim-lspconfig"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	{"hrsh7th/cmp-cmdline"},
	{"hrsh7th/nvim-cmp"},
	{
		"mason-org/mason.nvim",
    	opts = {}
	},
})
