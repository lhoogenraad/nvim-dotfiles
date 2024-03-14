function ColorMyPencils(color) 
	color = color or "PaperColor"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.cmd([[:highlight LeapBackDrop guifg=#f4cafc guibg=#222222]])
end

require('hlargs').setup{
	color = '#45ba8b'
}


ColorMyPencils()
