return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {"typescript", "python", "tsx", "markdown", "json", "lua"},
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = false },  
    })
  end
}
