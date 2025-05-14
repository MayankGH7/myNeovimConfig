return {
  "norcalli/nvim-colorizer.lua",
  disabled = true,
  config = function()
    vim.o.termguicolors = true
    require'colorizer'.setup({'*'})
  end
}
