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
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local lspkind = require('lspkind')

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

      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          maxwidth = {
            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- menu = function() return math.floor(0.45 * vim.o.columns) end,
            menu = 50, -- leading text (labelDetails)
            abbr = 50, -- actual suggestion item
          },
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function (entry, vim_item)
            -- ...
            return vim_item
          end
        })
      },

      window = {
        completion = {
          border = 'rounded',  -- Rounded corners for the border
          winhighlight = "Normal:CmpNormal,CursorLine:CmpCursorLine,Search:CmpSearch",
          scrollbar = false,  -- Disable the scrollbar
        },
        documentation = {
          border = 'rounded',
        },
      },
    })
  end,
}

