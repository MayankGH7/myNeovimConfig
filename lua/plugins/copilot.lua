return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
          suggestion = {
            auto_trigger = true,
            keymap = {
              accept = "<Tab>",
            },
          },
        })
      vim.keymap.set("i", "<Tab>", function()
        local copilot = require("copilot.suggestion")
        if copilot.is_visible() then
          copilot.accept()
        else
          return vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
        end
      end, { expr = true, silent = true })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = "copilot.lua",
    enabled = false,
    config = function()
      require("copilot_cmp").setup()
    end,
  }
}

