local lint = require("lint")
lint.linters_by_ft = {
  	javascript = { "eslint_d" },
  	javascriptreact = { "eslint_d" },
  	typescript = { "eslint_d" },
  	typescriptreact = { "eslint_d" },
  	vue = { "eslint_d" },
  	json = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  	callback = function() require("lint").try_lint() end,
})
