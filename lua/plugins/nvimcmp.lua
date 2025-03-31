return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- Added here since completion needs it too
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    -- Define get_capabilities inside this file
    local function get_capabilities()
      return cmp_nvim_lsp.default_capabilities()
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      --   ["<Tab>"] = cmp.mapping(function(fallback)
      --     if cmp.visible() then
      --       cmp.select_next_item()
      --     else
      --       fallback()
      --     end
      --   end, { "i", "s" }),
      --   ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        -- { name = "copilot", group_index = 2 },
        { name = 'nvim_lsp' }, -- Keep LSP source
        { name = 'luasnip' },
      }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
    })
  end,
}

