return {
  "Shatur/neovim-ayu",
  lazy = false,
  config = function()
    local is_termux = os.getenv("TERMUX_VERSION") ~= nil

    require('ayu').setup({

      overrides = is_termux and {
        Normal = { bg = "None" },
        NormalFloat = { bg = "none" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        VertSplit = { bg = "None" },
      } or {
        -- Normal = { bg = "#111111" },
        -- NormalFloat = { bg = "#111111" },
        -- ColorColumn = { bg = "#111111" },
        -- SignColumn = { bg = "#111111" },
        -- Folded = { bg = "#111111" },
        -- FoldColumn = { bg = "#111111" },
        -- CursorLine = { bg = "#111111" },
        -- CursorColumn = { bg = "#111111" },
        -- VertSplit = { bg = "#111111" },
      },

    })
  end
}

