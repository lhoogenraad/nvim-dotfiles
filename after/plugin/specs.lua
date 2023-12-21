require('specs').setup{ 
    show_jumps  = true,
    min_jump = 4,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 5, -- time increments used for fade/resize effects 
        blend = 90, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 50,
        winhl = "PMenu",
        fader = require('specs').sinus_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}
