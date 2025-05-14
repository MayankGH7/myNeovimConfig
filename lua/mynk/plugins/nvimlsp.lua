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

      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, bufopts)
      vim.keymap.set('n', "<leader>bf", vim.lsp.buf.format)

      vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "LSP Goto Reference" }))
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "LSP Goto Definition" }))
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "LSP Hover" }))
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "LSP Workspace Symbol" }))
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.setloclist() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "LSP Show Diagnostics" }))
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "Next Diagnostic" }))
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "Previous Diagnostic" }))
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "LSP Code Action" }))
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "LSP References" }))
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "LSP Rename" }))
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        vim.tbl_deep_extend("force", bufopts, { desc = "LSP Signature Help" }))
    end


    -- Define get_capabilities inside this file
    local function get_capabilities()
      return cmp_nvim_lsp.default_capabilities()
    end

    local capabilities = get_capabilities()

    lspconfig.pyright.setup({
      capabilities = capabilities,
      -- on_attach = function(client, bufnr)
      --   client.handlers["textDocument/publishDiagnostics"] = function(...) end
      --   on_attach(client, bufnr)
      -- end,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
            diagnosticMode = "off",
          },
        },
      },
    });

    -- lspconfig.ruff.setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- });

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
