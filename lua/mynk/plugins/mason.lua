return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    require 'mason'.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    require 'mason-lspconfig'.setup({
      automatic_enable = false,
      ensure_installed = {
        "lua_ls",
        "gopls",
        "clangd",
        "ts_ls",
        "cssls",
        "emmet_language_server",
        "jsonls",
        "ruff",
        "pyright",
      },

    })
  end,
}
