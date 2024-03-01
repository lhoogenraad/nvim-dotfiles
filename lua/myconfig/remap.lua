-- :Ex remap
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ll", vim.cmd.Ex)

-- :bw remap
vim.keymap.set("n", "<leader>bb", vim.cmd.bw)
vim.keymap.set("n", "<leader>tt", vim.cmd.Twilight)


-- Write and Close file
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
