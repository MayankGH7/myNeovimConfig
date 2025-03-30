return {
  'neovim/nvim-lspconfig',
  --event = 'BufReadPre',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- Only keep this
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●", -- You can change this symbol
        spacing = 4,
      },
      signs = true,
      underline = true,
      update_in_insert = false, -- Change to true if you want diagnostics to update while typing
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always", -- Shows source of diagnostic (e.g., tsserver, eslint)
      },
    })

    -- Define get_capabilities inside this file
    local function get_capabilities()
      return cmp_nvim_lsp.default_capabilities()
    end

    local capabilities = get_capabilities()

    -- Example LSP setup
    lspconfig.pyright.setup({
      capabilities = capabilities,
      -- Other LSP settings if needed
    });

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    });

    lspconfig.emmet_language_server.setup({
      capabilities = capabilities,
    });

    lspconfig.cssls.setup({
      capabilities = capabilities,
    });
  end,
}

