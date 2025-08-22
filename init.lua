
-- Check OS 
local is_win = (vim.fn.has("win32") == 1)

require("config.options")
require("config.keymaps")
require("config.autocmd")

if is_win then
	require("os.windows")
else 
	require("os.linux")
end

-- pcall(require, "plugins")
