-- Formatting
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.termguicolors = true
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4

-- Some random commands for text colouring
vim.cmd([[:highlight LeapBackDrop guifg=#f4cafc guibg=#222222]])
vim.cmd([[:hi IncSearch guibg=#47030f guifg=#adad71]])
vim.cmd([[:hi Search guibg=#6e0519 guifg=#adad71]])
vim.cmd([[:highlight HighlightUndo guibg=#b8645e]])
vim.cmd([[:highlight HighlightRedo guibg=#50913a]])
