return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        enabled = false,  -- Disable enhanced f/F/t/T motions
      },
    },
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  config = function () 
    -- Define custom highlight groups for flash.nvim
    vim.api.nvim_set_hl(0, 'FlashMatch', { fg = '#B8B5FF', bg = '#4A47A3' })
    vim.api.nvim_set_hl(0, 'FlashCurrent', { fg = '#D0E8F2', bg = '#456268' })
    vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#EEF5FF', bg = '#A25772' })

  end,
}

