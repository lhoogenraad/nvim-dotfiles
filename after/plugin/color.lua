local colors = {
	comments = { fg = "#6e6e6e", bg = "#222222", italic = true},
	colorColumn = { bg = "#910002"},
	identifiers = { fg = "#94c6ff" },
	numbers = { fg = "#9cd16b" },
	undo = { fg = "#ff000d", bg = "#000000"},
	redo = { fg = "#00ff0d", bg = "#000000"},
	leap = { bg = "#1e0724" },
	leapMatch = { fg = "#96fdff" },
	searchReplace = { bg = "#b3b334", fg = "#6e0519"},
	search = { bg = "#6e0519", fg = "#adad71"},
	strings = { fg = "#edb021" },
	delim = { fg = "#73ff00" },
	booleans = { fg = "#cb52ff" },
	functions = { fg = "#ff8a8a" },
	declarations = { fg = "#dbb951" },
	conditionals = { fg = "#ff00ee" },
	loops = { fg = "#43c2c4" },
	cursorline = { bg = "#280e47" }
}

function ColorMyPencils(color) 
	color = color or "PaperColor"
	vim.cmd.colorscheme(color)

	vim.cmd([[set cursorline]])
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.api.nvim_set_hl(0, "LeapBackDrop", colors.leap)
	vim.api.nvim_set_hl(0, "LeapMatch", colors.leapMatch)
	vim.api.nvim_set_hl(0, "IncSearch", colors.searchReplace)
	vim.api.nvim_set_hl(0, "Search", colors.search)

	vim.api.nvim_set_hl(0, "HighlightUndo", colors.undo)
	vim.api.nvim_set_hl(0, "HighlightRedo", colors.redo)

	vim.api.nvim_set_hl(0, "Comment", colors.comments)
	vim.api.nvim_set_hl(0, "SpecialComment", colors.comments)
	vim.api.nvim_set_hl(0, "Identifier", colors.identifiers)
	vim.api.nvim_set_hl(0, "ColorColumn", colors.colorColumn)
	vim.api.nvim_set_hl(0, "Number", colors.numbers)
	vim.api.nvim_set_hl(0, "Float", colors.numbers)

	vim.api.nvim_set_hl(0, "String", colors.strings)
	vim.api.nvim_set_hl(0, "Delimiter", colors.delim)
	vim.api.nvim_set_hl(0, "Boolean", colors.booleans)
	vim.api.nvim_set_hl(0, "Function", colors.functions)
	vim.api.nvim_set_hl(0, "javascriptIdentifier", colors.declarations)
	vim.api.nvim_set_hl(0, "javascriptConditional", colors.conditionals)
	vim.api.nvim_set_hl(0, "javascriptRepeat", colors.loops)

	vim.api.nvim_set_hl(0, "CursorLine", colors.cursorline)
end

function SetBgOpaque(color)
	color = color or "#210114"
	vim.api.nvim_set_hl(0, "Normal", { bg = color })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = color })
end

require('hlargs').setup{
	color = '#45ba8b'
}


ColorMyPencils()

