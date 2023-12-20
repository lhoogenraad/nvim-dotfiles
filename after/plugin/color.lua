function ColorMyPencils(color) 
	color = color or "PaperColor"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

require('hlargs').setup{
	color = '#45ba8b'
}
vim.cmd([[:highlight Nontext guibg=#222222 guifg=#ffffff]])

ColorMyPencils()
