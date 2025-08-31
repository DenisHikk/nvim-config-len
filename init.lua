
-- Check OS 
local is_win = (vim.fn.has("win32") == 1)

-- Core
require("core.options")
require("core.keymaps")
require("core.autocmd")
require("core.lazy")
require("core.colors")

-- Plugins
require("plugins.neotree")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.mason")
require("plugins.telescope")
require("plugins.autopairs")
require("plugins.nvim-lint")
require("plugins.conform")

-- Check if win32
if is_win then
	require("os.windows")
else 
	require("os.linux")
end

