-- Leap (replacement for add_default_mappings / create_default_mappings)
vim.keymap.set({ "n", "x", "o" }, "s",  "<Plug>(leap-forward)",      { silent = true })
vim.keymap.set({ "n", "x", "o" }, "S",  "<Plug>(leap-backward)",     { silent = true })
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)",  { silent = true })

