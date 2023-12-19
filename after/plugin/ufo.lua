require('ufo').setup({
	provider_selector = function(bufnr, filetype, buftype)
		return {'treesitter', 'indent'}
	end,
	open_fold_hl_timeout = 150,
})


vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true


vim.keymap.set('n', 'zX', require('ufo').openAllFolds)
vim.keymap.set('n', 'zC', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zz', function ()
	local winid = require('ufo').peekFoldedLinesUnderCursor()
	if not winid then
		-- choose one of coc.nvim and nvim lsp
		local success, err = pcall(function () vim.fn.CocActionAsync('definitionHover') end)
		if not success then
			print("No fold 🙈🙈🙈")
		else
			vim.lsp.buf.hover()
		end 
	end
end)
