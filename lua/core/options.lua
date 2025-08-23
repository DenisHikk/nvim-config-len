-- Variable for vim.opt
local opt = vim.opt

opt.number = true 			-- Show absolute numbers
opt.relativenumber = true 	-- Show relative numbers
opt.tabstop = 4 			-- Tab equals 4 spaces when reading files
opt.shiftwidth = 4
opt.smartindent = true         -- Smart auto-indentation
opt.wrap = false               -- Do not wrap long lines
opt.splitright = true          -- Vertical splits open to the right
opt.splitbelow = true          -- Horizontal splits open below
opt.ignorecase = true          -- Ignore case when searching...
opt.smartcase = true           -- ...unless search contains uppercase
opt.updatetime = 200           -- Faster completion/updates (ms)
opt.timeoutlen = 400           -- Timeout for mapped sequences (ms)
opt.scrolloff = 4              -- Keep 4 lines above/below cursor
opt.sidescrolloff = 8          -- Keep 8 columns left/right of cursor

opt.fileformats = {"unix", "dos"}
