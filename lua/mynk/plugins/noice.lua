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
    vim.cmd([[highlight NotifyBackground guibg=#000000]])
    require("notify").setup({
      render = "default",
      stages = "fade_in_slide_out",
      timeout = 3000,
      background_colour = "#000000",
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
              { find = "written" },
              { find = "fewer lines" },
              { find = "more lines" },
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              { find = ":%!" }
            }
          },
          view = "mini",
        },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        hover = {
          enabled = true,
          silent = false, -- set to true to not show a message if hover is not available
          view = nil,     -- when nil, use defaults from documentation
          opts = {
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            position = { row = 2, col = 0 },
            size = {
              max_width = math.floor(vim.o.columns * 0.7),
              max_height = math.floor(vim.o.lines * 0.3),
            },
          },
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- changed to true to handle long messages better
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
      views = {
        hover = {
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          size = {
            max_width = math.floor(vim.o.columns * 0.7),
            max_height = math.floor(vim.o.lines * 0.3),
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
    })
  end,
}
