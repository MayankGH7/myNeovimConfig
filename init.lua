require("config.lazy")

-- Key Mappings
vim.g.mapleader = " "             -- Set Space as leader key
-- Basic Settings
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Relative line numbers
vim.opt.tabstop = 2               -- Tab size of 2 spaces
vim.opt.shiftwidth = 2            -- Auto-indent size of 2 spaces
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.smartindent = true        -- Smart auto-indenting
vim.opt.wrap = false              -- Disable line wrapping
vim.opt.cursorline = true         -- Highlight current line
vim.opt.termguicolors = true      -- Enable true colors
vim.opt.signcolumn = "yes"        -- Always show sign column
--vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.scrolloff = 8             -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8         -- Keep 8 columns left/right of cursor
vim.opt.ignorecase = true         -- Case insensitive search
vim.opt.smartcase = true          -- Smart case-sensitive search
vim.opt.mouse = "a"               -- Enable mouse support
vim.opt.updatetime = 250          -- Faster update time for better performance
vim.opt.undofile = true           -- Persistent undo history
vim.opt.splitbelow = true         -- Split below instead of above
vim.opt.splitright = true         -- Split to the right instead of left
vim.opt.guicursor = "n-v-c:block,i:block-blinkwait300-blinkon200-blinkoff150"



-- Save file with Ctrl+S
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":wq<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q!<CR>", { noremap = true, silent = true })

vim.cmd([[colorscheme tokyonight-night]])
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")


vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})



