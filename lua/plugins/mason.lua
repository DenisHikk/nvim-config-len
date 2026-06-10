return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"ts_ls",
					"vue_ls",
					"pyright"
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			-- Go
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
					}
				}
			})

			-- TypeScript/JavaScript
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				init_options = {
					plugins = {
					},
				},
				filetypes = { 'javascript', 'typescript', 'vue' }
			})

			-- Vue 
			vim.lsp.config("vue_ls", {
				capabilities = capabilities,
				filetypes = { 'vue' }
			})

			-- Lua
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					}
				}
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,
				settings = {
					pyright = {
						analyses = {
							autoSearchPath = true,
							userLibraryCodeForTypes = true,
							typeCheckingMode = "basic",
							diagnosticMode = "openFilesOnly"
						}
					}
				}
			})

			vim.lsp.enable({
				"gopls",
				"ts_ls",
				"vue_ls",
				"lua_ls",
				"pyright"
			})
		end,
	}
}
