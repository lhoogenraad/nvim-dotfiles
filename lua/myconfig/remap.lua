-- jj to Esc to normal mode remap


local options = { noremap = true }
vim.keymap.set("i", "jj", "<Esc>", options)

-- :Ex remap
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ll", vim.cmd.Ex)

-- :bw remap
vim.keymap.set("n", "<leader>bb", vim.cmd.bw)
vim.keymap.set("n", "<leader>tt", vim.cmd.Twilight)


-- Write and Close file
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>ww", vim.cmd.w)

local function stopUsingArrowKeys()
	print("Stop using the damn arrow keys 😡😡😡")
end

local arrowRemapTable = {"n", "i", "v"}

vim.keymap.set(arrowRemapTable, "<Up>", stopUsingArrowKeys)
vim.keymap.set(arrowRemapTable, "<Down>", stopUsingArrowKeys)
vim.keymap.set(arrowRemapTable, "<Left>", stopUsingArrowKeys)
vim.keymap.set(arrowRemapTable, "<Right>", stopUsingArrowKeys)
