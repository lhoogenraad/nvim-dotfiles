-- gitsigns setup
require('gitsigns').setup{
signs = {
    add          = { text = '+' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,

  current_line_blame = true,
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
}


require'git-conflict'.setup()

-- Fugitive config
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>bl", function()
            vim.cmd.Git('blame')
        end)
vim.keymap.set("n", "<leader>gt", function()
            vim.cmd.Git('status')
        end)
vim.keymap.set("n", "<leader>gp", function()
            vim.cmd.Git('pull')
        end)
vim.keymap.set("n", "<leader>gc", function()
            vim.cmd.Git('add .');
			vim.cmd.Git();
			vim.cmd.Git('commit');
        end)
vim.keymap.set("n", "<leader>gg", function()
            vim.cmd.Git('push');
        end)

print("hey")

local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = ThePrimeagen_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})
