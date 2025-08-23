vim.opt.termguicolors = true

function SetColor(color)
	color = color or "unokai"
	vim.cmd.colorscheme(color)
end

SetColor()
