return {
  'stevearc/conform.nvim',
  -- event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      format_on_save = {
        -- timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua", lsp_format = "fallback" },
        python = { "ruff", lsp_format = "fallback" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettier", "prettierd", stop_after_first = true },
        typescript = { "prettier", "prettierd", stop_after_first = true },
        golang = { "gofmt", lsp_format = "fallback" },
        javascriptreact = { { "prettierd", "prettier", stop_after_first = true } },
        typescriptreact = { { "prettierd", "prettier", stop_after_first = true } },
        json = { { "prettierd", "prettier", stop_after_first = true } },
        graphql = { { "prettierd", "prettier", stop_after_first = true } },
        markdown = { { "prettierd", "prettier", stop_after_first = true } },
        css = { { "prettierd", "prettier", stop_after_first = true } },
        scss = { { "prettierd", "prettier", stop_after_first = true } },
        -- html = { "htmlbeautifier" },
        -- bash = { "beautysh" },
        -- proto = { "buf" },
        -- yaml = { "yamlfix" },
        -- toml = { "taplo" },
      },
    })
    vim.keymap.set({ "n", "v" }, "<leader>l", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end
}
