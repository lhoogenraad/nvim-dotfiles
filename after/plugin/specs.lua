require('specs').setup{ 
    show_jumps  = true,
    min_jump = 4,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 1, -- time increments used for fade/resize effects 
        blend = 30, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 50,
        winhl = "PMenu",
        fader = require('specs').pulse_fader,
        resizer = require('specs').slider_resizer,
    },
    ignore_filetypes = {},
    ignore_buftypes = {},
}
