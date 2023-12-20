local current_day = os.date("%A")
builtin = require("veil.builtin")
require('veil').setup({sections = {
    builtin.sections.animated(builtin.headers.frames_days_of_week[current_day], {
      hl = { fg = "#5de4c7" },
    }),
},
  mappings = {},
  startup = true,
  listed = false
})
