return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", ":Git | only<CR>", { desc = "Open Fugitive Panel" })
  end
}
