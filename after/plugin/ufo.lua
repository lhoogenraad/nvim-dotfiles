require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end,
  open_fold_hl_timeout = 150,
})

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Keep these as-is (all folds)
vim.keymap.set('n', 'zX', function() require('ufo').openAllFolds() end, { desc = 'Open all folds (ufo)' })
vim.keymap.set('n', 'zC', function() require('ufo').closeAllFolds() end, { desc = 'Close all folds (ufo)' })

-- New: current fold only
vim.keymap.set('n', 'zx', function()
  -- open fold under cursor
  vim.cmd('normal! zo')
end, { desc = 'Open current fold' })

vim.keymap.set('n', 'zc', function()
  -- close fold under cursor
  vim.cmd('normal! zc')
end, { desc = 'Close current fold' })

vim.keymap.set('n', 'zz', function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    local success = pcall(function() vim.fn.CocActionAsync('definitionHover') end)
    if not success then
      print("No fold 🙈🙈🙈")
    else
      vim.lsp.buf.hover()
    end
  end
end)

