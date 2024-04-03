-- jj to Esc to normal mode remap


local options = { noremap = true }
vim.keymap.set("i", "jj", "<Esc>", options)
vim.keymap.set("i", "jw", "<Esc>:w<CR>", options)
vim.keymap.set("i", "<Esc>", "<nop>", options)
vim.g.mapleader = " "

-- :Ex remap
vim.keymap.set("n", "<leader>ll", vim.cmd.Ex)

-- :bw remap
vim.keymap.set("n", "<leader>bb", vim.cmd.bw)
vim.keymap.set("n", "<leader>tt", vim.cmd.Twilight)

-- :noh remap
vim.keymap.set("n", "<leader>cs", vim.cmd.noh)

-- Write and Close file
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>ww", vim.cmd.w, options)

-- Ctrl-w remap for window moving
vim.keymap.set("n", ";", "<C-w>", options)
vim.keymap.set("n", ";v", vim.cmd.vsplit, options)

-- Paste last yank in register regardless of deleting
vim.keymap.set("n", "<leader>p", "\"0p")

-- Formats entire current file. Shift= is keypress
vim.keymap.set("n", "<leader>fa", "mtgg=G't", options)

local function stopUsingArrowKeys()
	print("Stop using the damn arrow keys 😡😡😡")
end

local arrowRemapTable = {"n", "v"}

vim.keymap.set(arrowRemapTable, "<Up>", stopUsingArrowKeys)
vim.keymap.set(arrowRemapTable, "<Down>", stopUsingArrowKeys)
vim.keymap.set(arrowRemapTable, "<Left>", stopUsingArrowKeys)
vim.keymap.set(arrowRemapTable, "<Right>", stopUsingArrowKeys)
