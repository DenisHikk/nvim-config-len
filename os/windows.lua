-- Use PowerShell as default shell in Windows
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellquote = ""      -- Disable shell quotes
vim.opt.shellxquote = ""     -- Disable shell xquotes

-- Clipboard works out of the box via Windows API
-- Font names may differ if using GUI client (e.g. Neovide)
