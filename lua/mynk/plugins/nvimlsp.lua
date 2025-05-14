return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')


    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 4,
      },
      -- virtual_lines = { current_line = true },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
      },
    })

    -- Function to handle keymaps when LSP attaches
    local function on_attach(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      -- Hover documentation
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover({
          border = "rounded",
        })
      end, bufopts)
      -- Show diagnostics in floating window
      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, bufopts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
      vim.keymap.set('n', "<leader>bf", vim.lsp.buf.format)
    end


    -- Define get_capabilities inside this file
    local function get_capabilities()
      return cmp_nvim_lsp.default_capabilities()
    end

    local capabilities = get_capabilities()

    -- Example LSP setup
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    });

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    });

    lspconfig.emmet_language_server.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    });

    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
        less = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    });


    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    });


    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    });

    lspconfig.jsonls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    });

    lspconfig.clangd.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "clangd", "--background-index" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
      root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
    });

    lspconfig.gopls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    });
  end,
}
