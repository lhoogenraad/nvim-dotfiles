local windline = require('windline')
local helper = require('windline.helpers')
local b_components = require('windline.components.basic')
local state = _G.WindLine.state

local sep = helper.separators
local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')

local hl_list = {
	Black = { 'white', 'black' },
	White = { 'black', 'white' },
	Inactive = { 'InactiveFg', 'InactiveBg' },
	Active = { 'ActiveFg', 'ActiveBg' },
}
local basic = {}

local breakpoint_width = 90
basic.divider = { b_components.divider, '' }
basic.bg = { ' ', 'StatusLine' }

local colors_mode = {
	Normal = { 'blue', 'black' },
	Insert = { 'green', 'black' },
	Visual = { 'yellow', 'black' },
	Replace = { 'blue_light', 'black' },
	Command = { 'cyan', 'black' },
}

colors_mode_bg = {
	Normal = { 'black', 'blue', 'bold' },
	Insert = { 'black', 'green', 'bold' },
	Visual = { 'black', 'yellow', 'bold' },
	Replace = { 'black', 'blue_light', 'bold' },
	Command = { 'black', 'cyan', 'bold' },
	NormalBefore = { 'red', 'black' },
	InsertBefore = { 'green', 'black' },
	VisualBefore = { 'yellow', 'black' },
	ReplaceBefore = { 'blue_light', 'black' },
	CommandBefore = { 'cyan', 'black' },
	NormalAfter = { 'white', 'red' },
	InsertAfter = { 'white', 'green' },
	VisualAfter = { 'white', 'yellow' },
	ReplaceAfter = { 'white', 'blue_light' },
	CommandAfter = { 'white', 'cyan' },
}

basic.vi_mode = {
	name = 'vi_mode',
	hl_colors = colors_mode_bg,
	text = function()
		return {
			{ sep.right_filled, state.mode[2] },
			{ '  ' .. state.mode[1] .. '  ', state.mode[2] },
			{ sep.left_filled, state.mode[2] },
		}
	end,
}

basic.square_mode = {
	hl_colors = colors_mode,
	text = function()
		return { 
			{ sep.left_filled, state.mode[2] },
			{ sep.right_filled, state.mode[2] },
			{ sep.left_filled, state.mode[2] },
			{ sep.right_filled, state.mode[2] },
			{ sep.left_filled, state.mode[2] },
			{ sep.right_filled, state.mode[2] },
		}
	end,
}

basic.lsp_diagnos = {
	name = 'diagnostic',
	hl_colors = {
		red = { 'red', 'black' },
		yellow = { 'yellow', 'black' },
		blue = { 'blue', 'black' },
	},
	width = breakpoint_width,
	text = function(bufnr)
		if lsp_comps.check_lsp(bufnr) then
			return {
				{ lsp_comps.lsp_error({ format = '  %s', show_zero = true }), 'red' },
				{ lsp_comps.lsp_warning({ format = '  %s', show_zero = true }), 'yellow' },
				{ lsp_comps.lsp_hint({ format = '  %s', show_zero = true }), 'blue' },
			}
		end
		return ''
	end,
}
basic.file = {
	name = 'file',
	hl_colors = {
		default = hl_list.Black,
		white = { 'white', 'black' },
		magenta = { 'magenta', 'black' },
		Normal = { 'blue', 'black',  'bold' },
		Insert = { 'green', 'black', 'bold' },
		Visual = { 'yellow','black', 'bold' },
		Command = { 'cyan', 'black', 'bold' },
	},
	text = function(_, _, width)
		if width > breakpoint_width then
			print(state.mode[2])
			return {
				{ b_components.cache_file_size(), 'default' },
				{ ' ', '' },
				{ b_components.full_file_name, state.mode[2] },
				{ b_components.line_col_lua, 'white' },
				{ b_components.progress_lua, '' },
				{ ' ', '' },
				{ b_components.file_modified('        '), {'yellow', 'black'} },
			}
		else
			return {
				{ b_components.cache_file_name('N/A', 'short'), { 'red', 'black' } },
				{ ' ', '' },
				{ b_components.file_modified('        '), {'yellow', 'black'} },
			}
		end
	end,
}
basic.file_right = {
	hl_colors = {
		default = hl_list.Black,
		white = { 'white', 'black' },
		magenta = { 'magenta', 'black' },
	},
	text = function(_, _, width)
		if width < breakpoint_width then
			return {
				{ b_components.line_col_lua, 'white' },
				{ b_components.progress_lua, '' },
			}
		end
	end,
}
basic.git = {
	name = 'git',
	hl_colors = {
		green = { 'green', 'black' },
		red = { 'red', 'black' },
		blue = { 'blue', 'black' },
	},
	width = breakpoint_width,
	text = function(bufnr)
		if git_comps.is_git(bufnr) then
			return {
				{ git_comps.diff_added({ format = '  %s', show_zero = true }), 'green' },
				{ git_comps.diff_removed({ format = '  %s', show_zero = true }), 'red' },
				{ git_comps.diff_changed({ format = '  %s', show_zero = true }), 'blue' },
			}
		end
		return ''
	end,
}

local quickfix = {
	filetypes = { 'qf', 'Trouble' },
	active = {
		{ '🚦 Quickfix ', { 'white', 'black' } },
		{ helper.separators.slant_right, { 'black', 'black_light' } },
		{
			function()
				return vim.fn.getqflist({ title = 0 }).title
			end,
			{ 'cyan', 'black_light' },
		},
		{ ' Total : %L ', { 'cyan', 'black_light' } },
		{ helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
		{ ' ', { 'InactiveFg', 'InactiveBg' } },
		basic.divider,
		{ helper.separators.slant_right, { 'InactiveBg', 'black' } },
		{ '🧛 ', { 'white', 'black' } },
	},

	always_active = true,
	show_last_status = true,
}

local explorer = {
	filetypes = { 'fern', 'NvimTree', 'lir' },
	active = {
		{ '  ', { 'black', 'red' } },
		{ helper.separators.slant_right, { 'red', 'NormalBg' } },
		{ b_components.divider, '' },
		{ b_components.file_name(''), { 'white', 'NormalBg' } },
	},
	always_active = true,
	show_last_status = true,
}

basic.lsp_name = {
	width = breakpoint_width,
	name = 'lsp_name',
	hl_colors = {
		magenta = { 'magenta', 'black' },
	},
	text = function(bufnr)
		if lsp_comps.check_lsp(bufnr) then
			return {
				{ lsp_comps.lsp_name(), 'magenta' },
			}
		end
		return {
			{ b_components.cache_file_type({icon = true}), 'magenta' },
		}
	end,
}


basic.vi_mode_sep_left = {
	name = 'vi_mode_sep_left',
	hl_colors = colors_mode,
	text = function()
		return { { sep.right_filled, state.mode[2] } }
	end,
}

-- Checks if virtaul text for lsp diagnostics are enabled or nah
local function virtual_text_status()
	local vt_config = vim.diagnostic.config().virtual_text
	if vt_config == false then
		return "lsp diagnostics: Off"
	else
		return "lsp diagnostics: On"
	end
end


local default = {
	filetypes = { 'default' },
	active = {
		basic.vi_mode,
		{'   ', {'black', 'black'}},
		basic.file,
		{ virtual_text_status }, -- Added Virtual Text Status
		basic.lsp_diagnos,
		{'     ', ''},
		basic.square_mode,
		basic.divider,
		basic.square_mode,
		{'  ', ''},
		basic.file_right,
		basic.lsp_name,
		basic.git,
		{ git_comps.git_branch(), { 'white', 'black' }, breakpoint_width },
		{ ' ', hl_list.Black },
		basic.square_mode,
	},
	inactive = {
		{ b_components.full_file_name, hl_list.Inactive },
		basic.file_name_inactive,
		basic.divider,
		basic.divider,
		{ git_comps.git_branch(), { 'black', 'InactiveBg' }, breakpoint_width },
		{ b_components.line_col, hl_list.Inactive },
		{ b_components.progress, hl_list.Inactive },
	},
}

windline.setup({
	colors_name = function(colors)
		-- print(vim.inspect(colors))
		-- ADD MORE COLOR HERE ----
		return colors
	end,
	statuslines = {
		default,
		quickfix,
		explorer,
	},
})
