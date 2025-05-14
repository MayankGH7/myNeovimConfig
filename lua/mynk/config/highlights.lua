-- Set indent line character highlight
vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#3b3b4f", nocombine = true })

-- Set floating window highlights
vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })

-- Ensure highlights persist after colorscheme changes
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
  end,
})
