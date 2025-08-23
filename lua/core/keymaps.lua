vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NeoTree keymaps
map('n', '<leader>e', ':Neotree float focus<CR>')
map('n', '<leader>o', ':Neotree git_status<CR>')
