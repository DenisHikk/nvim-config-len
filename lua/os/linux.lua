-- Use bash as default shell
vim.opt.shell = "/bin/bash"

-- To enable system clipboard, install xclip/xsel/wl-clipboard and uncomment:
vim.opt.clipboard = "unnamedplus"

-- Check for useful binaries and warn if missing
local function warn_if_missing(bin)
  if vim.fn.executable(bin) == 0 then
    vim.schedule(function()
      vim.notify(("Install '%s' for better experience (used by Telescope, etc.)"):format(bin), vim.log.levels.WARN)
    end)
  end
end

warn_if_missing("rg")  -- ripgrep for searching
warn_if_missing("fd")  -- fd for file finding
