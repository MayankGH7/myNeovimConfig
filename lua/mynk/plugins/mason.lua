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

    local servers = {
        "lua_ls",
        "gopls",
        "ts_ls",
        "cssls",
        "emmet_language_server",
        "jsonls",
        "pyright"
      }
    local is_termux = os.getenv("TERMUX_VERSION")

    if not is_termux then
      table.insert(servers, "ruff")
      table.insert(servers, "clangd")
    end

    require 'mason-lspconfig'.setup({
      automatic_enable = false,
      ensure_installed = servers,
    })
  end,
}
