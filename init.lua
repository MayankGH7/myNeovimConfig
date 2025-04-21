
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load plugin manager
require("config.lazy")

vim.cmd([[colorscheme catppuccin-mocha]])

-- Load core configuration
require("config.options")
require("config.highlights")
require("config.keymaps")
require("config.autocmds")
