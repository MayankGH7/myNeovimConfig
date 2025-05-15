return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    local context = require("treesitter-context")
    context.setup({
      max_lines = 5,
      -- separator = '─'
    })

    -- Disable for certain filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "text" },
      callback = function()
        context.disable()
      end,
    })
  end,
}

