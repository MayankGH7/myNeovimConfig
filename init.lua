
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load plugin manager
require("mynk.config.lazy")

vim.cmd([[colorscheme catppuccin-mocha]])
-- vim.cmd([[colorscheme rose-pine]])

-- Load core mynk.configuration
require("mynk.config.options")
require("mynk.config.highlights")
require("mynk.config.keymaps")
require("mynk.config.autocmds")
