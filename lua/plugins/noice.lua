local is_termux = os.getenv("TERMUX_VERSION") ~= nil
return {
  "folke/noice.nvim",
  enabled = vim.env.TERMUX_VERSION == nil,
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
        -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
          require("notify").setup({
              render = "default",
              stages = "fade_in_slide_out",
              timeout = 3000,
              -- background_colour = "#000000",
              fps = 60,
              max_width = math.floor(vim.o.columns * 0.4),
              max_height = math.floor(vim.o.lines * 0.3),
              on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
              end,
            })
      require("noice").setup({
          routes = {
            {
              filter = {
                event = "msg_show",
                kind = "",
                any = {
                  {find = "written"},
                  {find = "fewer lines"},
                  {find = "more lines"},
                }
              },
              -- view = "mini",
              view = "mini",
              -- opts = { stop = true },
            },
          },
          lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
          },
          -- you can enable a preset for easier configuration
          presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
          },
        })
    end,
  }
