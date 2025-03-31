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

