-- :Ex remap
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.g.mapleader = " "

-- Trouble Mappings
vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
