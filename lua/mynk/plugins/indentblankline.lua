return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local hooks = require("ibl.hooks")

    -- Colorscope-aware highlight fix (optional)
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b3b4f", nocombine = true })
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#c678dd", nocombine = true })

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#c678dd", nocombine = true })
    end)

    require("ibl").setup {
      indent = {
        char = "│",
        highlight = "IblIndent",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = "IblScope",
        injected_languages = true, -- useful if you write code inside markdown or HTML
        priority = 500, -- helps show outer + inner
      },
      whitespace = {
        remove_blankline_trail = true,
      },
    }
  end
}

