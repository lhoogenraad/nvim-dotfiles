function ColorMyPencils(color) 
	color = color or "PaperColor"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.cmd([[:highlight LeapBackDrop guifg=#f4cafc guibg=#222222]])
	vim.cmd([[:hi IncSearch guibg=#47030f guifg=#adad71]])
	vim.cmd([[:hi Search guibg=#6e0519 guifg=#adad71]])
	vim.cmd([[:hi HighlightUndo guibg=#b8645e]])
	vim.cmd([[:hi HighlightRedo guibg=#50913a]])
	vim.cmd([[:hi ColorColumn guibg=#491896]])
end

require('hlargs').setup{
	color = '#45ba8b'
}


ColorMyPencils()
