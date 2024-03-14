local windline = require('windline')
local helper = require('windline.helpers')
local utils = require('windline.utils')
local sep = helper.separators
local animation = require('wlanimation')
local efffects = require('wlanimation.effects')
local git_comps = require('windline.components.git')
local b_components = require('windline.components.basic')

local state = _G.WindLine.state

local hl_list = {
    Black = { 'white', 'black' },
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
	None = { 'none', 'none' }
}
local basic = {}

basic.divider = { '%=', hl_list.Black }
basic.inactive_divider = {
	name = 'inactive_divider',
	text = function()
		return { 
			{'   ', { 'InactiveBg', 'InactiveBg' }},
			{ sep.right_rounded, { 'InactiveBg', 'black' } },
			{ b_components.divider, hl_list.None },
		}
	end,
}

basic.space = { ' ', '' }
basic.line_col = { [[ %3l:%-2c ]], hl_list.Black }
basic.progress = { [[%3p%% ]], hl_list.Black }
basic.bg = { ' ', 'StatusLine' }
basic.file_name_inactive = { '%f', hl_list.Inactive }
basic.line_col_inactive = { [[ %3l:%-2c ]], hl_list.Inactive }
basic.progress_inactive = { [[%3p%% ]], hl_list.Inactive }

utils.change_mode_name({
    ['n'] = { ' NORMAL', 'Normal' },
    ['no'] = { ' O-PENDING', 'Visual' },
    ['nov'] = { ' O-PENDING', 'Visual' },
    ['noV'] = { ' O-PENDING', 'Visual' },
    ['no'] = { ' O-PENDING', 'Visual' },
    ['niI'] = { ' NORMAL', 'Normal' },
    ['niR'] = { ' NORMAL', 'Normal' },
    ['niV'] = { ' NORMAL', 'Normal' },
    ['v'] = { '🧐 VISUAL', 'Visual' },
    ['V'] = { '🧐 V-LINE', 'Visual' },
    [''] = { '🧐 V-BLOCK', 'Visual' },
    ['s'] = { ' SELECT', 'Visual' },
    ['S'] = { ' S-LINE', 'Visual' },
    [''] = { ' S-BLOCK', 'Visual' },
    ['i'] = { ' INSERT', 'Insert' },
    ['ic'] = { ' INSERT', 'Insert' },
    ['ix'] = { ' INSERT', 'Insert' },
    ['R'] = { ' REPLACE', 'Replace' },
    ['Rc'] = { ' REPLACE', 'Replace' },
    ['Rv'] = { 'V-REPLACE', 'Normal' },
    ['Rx'] = { ' REPLACE', 'Normal' },
    ['c'] = { ' COMMAND', 'Command' },
    ['cv'] = { ' COMMAND', 'Command' },
    ['ce'] = { ' COMMAND', 'Command' },
    ['r'] = { ' REPLACE', 'Replace' },
    ['rm'] = { ' MORE', 'Normal' },
    ['r?'] = { ' CONFIRM', 'Normal' },
    ['!'] = { ' SHELL', 'Normal' },
    ['t'] = { ' TERMINAL', 'Command' },
})

basic.vi_mode = {
    name = 'vi_mode',
    hl_colors = {
        Normal = { 'white', 'black' },
        Insert = { 'black', 'red' },
        Visual = { 'black', 'green' },
        Replace = { 'black', 'cyan' },
        Command = { 'black', 'yellow' },
    },
    text = function()
        return ' ' .. state.mode[1] .. ' '
    end,
    hl = function()
        return state.mode[2]
    end,
}

basic.vi_git_changes = {
    width = 150,
    hl_colors = {
        green = { 'green', 'black' },
        red = { 'red', 'black' },
        blue = { 'blue', 'black' },
    },
    text = function(bufnr)
        if git_comps.is_git(bufnr) then
            return {
                { ' ', '' },
                { git_comps.diff_added({ format = ' %s' }), 'green' },
                { git_comps.diff_removed({ format = '  %s' }), 'red' },
                { git_comps.diff_changed({ format = '  %s' }), 'blue' },
            }
        end
        return ''
    end,
}

basic.vi_git_changes_sep = {
	name = 'vi_git_changes_sep ',
	text = function()
		return sep.right_rounded
	end,
	hl = function()
		return {'black', 'black'}
	end,
}

basic.vi_git_branch = {
	name = 'vi_git_branch ',
	width = 150,
	text = function(bufnr)
		if git_comps.is_git(bufnr) then
			return {
				{ git_comps.git_branch(), { 'waveleft1', 'black' }},
			}
		end
		return ''
	end,
	click = change_wave_color
}

basic.vi_mode_sep = {
    name = 'vi_mode_sep',
    hl_colors = {
        Normal = { 'black', 'black' },
        Insert = { 'red', 'black' },
        Visual = { 'green', 'black' },
        Replace = { 'cyan', 'black' },
        Command = { 'yellow', 'black' },
    },
    text = function()
        return sep.right_rounded
    end,
    hl = function()
        return state.mode[2]
    end,
}

basic.file_name = {
    text = function()
        local name = vim.fn.expand('%:p:t')
        if name == '' then
            name = '[No Name]'
        end
        return { 
			{ name .. ' ' , {'waveleft1', 'black'}}
		}
    end,
    hl_colors = { 'FilenameFg', 'FilenameBg' },
}

local status_color = 'blue'
local change_wave_color = function()
    local anim_colors = {
        '#7d0180',
        '#a112a3',
        '#871dab',
        '#892fc4',
        '#6a32bf',
        '#7348d9',
        '#8b61ed',
        '#9f7af5',
    }
    if status_color == 'blue' then
		anim_colors = {
			'#7d0180',
			'#a112a3',
			'#871dab',
			'#892fc4',
			'#6a32bf',
			'#7348d9',
			'#8b61ed',
			'#9f7af5',
		}
        status_color = 'yellow'
    else
        status_color = 'blue'
    end

    animation.stop_all()
    animation.animation({
        data = {
            { 'waveleft1', efffects.list_color(anim_colors, 6) },
            { 'waveleft2', efffects.list_color(anim_colors, 5) },
            { 'waveleft3', efffects.list_color(anim_colors, 4) },
            { 'waveleft4', efffects.list_color(anim_colors, 3) },
            { 'waveleft5', efffects.list_color(anim_colors, 2) },
        },
        timeout = 100,
        delay = 200,
        interval = 150,
    })

    animation.animation({
        data = {
            { 'waveright1', efffects.list_color(anim_colors, 2) },
            { 'waveright2', efffects.list_color(anim_colors, 3) },
            { 'waveright3', efffects.list_color(anim_colors, 4) },
            { 'waveright4', efffects.list_color(anim_colors, 5) },
            { 'waveright5', efffects.list_color(anim_colors, 6) },
        },
        timeout = 100,
        delay = 200,
        interval = 150,
    })
end

local wave_left = {
    text = function()
        return {
            { sep.right_rounded .. ' ', { 'waveleft5', 'waveleft1' } },
            { sep.right_rounded .. ' ', { 'waveleft1', 'waveleft2' } },
            { sep.right_rounded .. ' ', { 'waveleft2', 'waveleft3' } },
            { sep.right_rounded .. ' ', { 'waveleft3', 'waveleft4' } },
            { sep.right_rounded .. ' ', { 'waveleft4', 'waveleft5' } },
            { sep.right_rounded .. ' ', { 'waveleft5', 'black' } },
        }
    end,
    click = change_wave_color,
}

local wave_right = {
    text = function()
        return {
            { ' ' .. sep.left_rounded, { 'waveright1', 'black' } },
            { ' ' .. sep.left_rounded, { 'waveright2', 'waveright1' } },
            { ' ' .. sep.left_rounded, { 'waveright3', 'waveright2' } },
            { ' ' .. sep.left_rounded, { 'waveright4', 'waveright3' } },
            { ' ' .. sep.left_rounded, { 'waveright5', 'waveright4' } },
            { ' ' .. sep.left_rounded, { 'waveright1', 'waveright5' } },
        }
    end,
    click = change_wave_color,
}

local default = {
    filetypes = { 'default' },
    active = {
        basic.vi_mode,
        basic.vi_mode_sep,
		basic.space,
		basic.vi_git_changes,
        basic.vi_git_changes_sep,
		basic.space,
        basic.file_name,
        wave_left,
        basic.divider,
        wave_right,
		basic.vi_git_branch,
        basic.line_col,
        basic.progress,
    },
    inactive = {
        basic.file_name_inactive,
		basic.inactive_divider,
    },
}

windline.setup({
    colors_name = function(colors)
        colors.FilenameFg = colors.white
        colors.FilenameBg = colors.black_light

        colors.wavedefault = colors.white_light
        colors.waveleft1 = colors.wavedefault
        colors.waveleft2 = colors.wavedefault
        colors.waveleft3 = colors.wavedefault
        colors.waveleft4 = colors.wavedefault
        colors.waveleft5 = colors.wavedefault

        colors.waveright1 = colors.wavedefault
        colors.waveright2 = colors.wavedefault
        colors.waveright3 = colors.wavedefault
        colors.waveright4 = colors.wavedefault
        colors.waveright5 = colors.wavedefault
        return colors
    end,
    statuslines = {
        default,
    },
})

vim.defer_fn(function()
    change_wave_color()
end, 100)
