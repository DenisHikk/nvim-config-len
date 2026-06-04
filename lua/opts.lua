-- leader key it's space
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true

-- using tab not space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false 
vim.smartindent = true

-- show invisible symbols
vim.opt.list = true
vim.opt.listchars = {
	tab = "→ ",
	trail = "•",
	space = "·"
}

vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.backup = false

-- undo to file
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- scrolloff for visible 8 lines near cursor 
vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.updatetime = 500 

