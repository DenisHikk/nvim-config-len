
-- Check OS 
local is_win = (vim.fn.has("win32") == 1)

require("lua.core.options")
require("lua.core.keymaps")
require("lua.core.autocmd")

if is_win then
	require("os.windows")
else 
	require("os.linux")
end

-- pcall(require, "plugins")
