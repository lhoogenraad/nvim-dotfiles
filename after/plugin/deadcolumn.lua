local opts = {
    scope = 'visible',
    modes = {'n', 'v' , 'i', 
	'ic', 'ix', 'R', 'Rc', 'Rx', 'Rv', 'Rvc', 'Rvx' },
    blending = {
        colorcode = '#ffda73',
        hlgroup = {
            'Nontext',
            'background',
        },
    },
    warning = {
        alpha = 1,
        offset = 0,
        colorcode = '#ff3333',
        hlgroup = {
            'Error',
            'background',
        },
    },
    extra = {
        follow_tw = nil,
    },
}

require('deadcolumn').setup(opts) -- Call the setup function

vim.cmd([[setlocal colorcolumn=80]])
