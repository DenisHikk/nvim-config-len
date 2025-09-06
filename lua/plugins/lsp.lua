-- path to mason
local mason = vim.fn.stdpath("data") .. "/mason"

local vue_language_server_path = mason .. "/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript", -- как в доке
}

-- config ts_ls
local tsserver_filetypes = {
	"typescript", "javascript", "javascriptreact", "typescriptreact", "vue"
}

vim.lsp.config("ts_ls", {
	init_options = {
		plugins = { vue_plugin },
		hostInfo = "neovim",
	},
	filetypes = tsserver_filetypes,
	on_attach = function(client, bufnr)
		if vim.bo[bufnr].filetype == "vue" then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			if client.server_capabilities.semanticTokensProvider then
				client.server_capabilities.semanticTokensProvider.full = false
			end
		end
	end,
})

-- config vue_ls
vim.lsp.config("vue_ls", {
	on_init = function(client)
		client.handlers['tsserver/request'] = function(_, result, context)
			local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'ts_ls' })
			local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
			local clients = {}
			vim.list_extend(clients, ts_clients)
			vim.list_extend(clients, vtsls_clients)
			if #clients == 0 then
				vim.notify('Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.',
					vim.log.levels.ERROR)
				return
			end
			local ts_client = clients[1]
			local param = unpack(result)
			local id, command, payload = unpack(param)
			ts_client:exec_cmd({
				title = 'vue_request_forward',
				command = 'typescript.tsserverRequest',
				arguments = { command, payload },
			}, { bufnr = context.bufnr }, function(_, r)
				local response = r and r.body
				local response_data = { { id, response } }
				---@diagnostic disable-next-line: param-type-mismatch
				client:notify('tsserver/response', response_data)
			end)
		end
	end,
	filetypes = { "vue" },
})

vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("ts_ls")
vim.lsp.enable({ "vue_ls", "ts_ls" })


-- Global mappings
-- See :help vim.diagnostic.* for docs on any of the below functions
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>lD', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion trigger by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<leader>lf', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end
})
