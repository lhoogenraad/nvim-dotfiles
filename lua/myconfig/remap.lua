local options = { noremap = true }

-- Mappings to escape insert mode in some fashion
vim.keymap.set("i", "jj", "<Esc>", options)
vim.keymap.set("i", "jw", "<Esc>:w<CR>", options)
vim.keymap.set("i", "jk", "<Esc>u", options)
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
vim.keymap.set("n", "<C-w>", "<nop>")

-- Paste last yank in register regardless of deleting
vim.keymap.set("n", "<leader>p", "\"0p")

-- Formats entire current file. Shift= is keypress
vim.keymap.set("n", "<leader>fa", "mtgg=G't", options)

-- Brings search results to centre of screen
vim.keymap.set("n", "n", "nzz", options)
vim.keymap.set("n", "N", "Nzz", options)

-- Makes new set of curly braces and goes to centre e.g.
-- {
-- 		_Goes here_
-- }
vim.keymap.set("i", "<M-{>", "{<CR><CR>}<UP><C-f>");

-- Remap arrow keys to navigate around buffer windows
local arrowRemapTable = {"n", "v"}
vim.keymap.set(arrowRemapTable, "<Up>", "<C-W>k")
vim.keymap.set(arrowRemapTable, "<Down>", "<C-W>j")
vim.keymap.set(arrowRemapTable, "<Left>", "<C-W>h")
vim.keymap.set(arrowRemapTable, "<Right>", "<C-W>l")

-- Go back to alternate file
vim.api.nvim_set_keymap('n', '<bs>', '<c-^>\'”zz', { silent = true, noremap = true })

-- LSP AutoCmp
vim.keymap.set("i", "<C-z>", "<C-p>", options)


-- Try-Catch macros
vim.keymap.set("n", "<leader>tc", "itry {<CR><CR>} catch (error) {<CR><CR>}<Up><Up><Up><Tab>")
