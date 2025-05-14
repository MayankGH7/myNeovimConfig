-- Vim options configuration

-- -- LSP hover configuration
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--   vim.lsp.handlers.hover,
--   { border = 'rounded' }
-- )

-- Basic editor options
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.tabstop = 2           -- Tab size of 2 spaces
vim.opt.shiftwidth = 2        -- Auto-indent size of 2 spaces
vim.opt.expandtab = true      -- Use spaces instead of tab
vim.opt.smartindent = false   -- Smart auto-indenting
vim.opt.wrap = true           -- Enable line wrapping
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.cursorline = true    -- Highlight current line
vim.opt.termguicolors = true -- Enable true colors
vim.opt.signcolumn = "yes"   -- Always show sign column
--vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.scrolloff = 8        -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8    -- Keep 8 columns left/right of cursor
vim.opt.ignorecase = true    -- Case insensitive search
vim.opt.smartcase = true     -- Smart case-sensitive search
vim.opt.mouse = "a"          -- Enable mouse support
vim.opt.updatetime = 250     -- Faster update time for better performance
vim.opt.undofile = true      -- Persistent undo history
vim.opt.splitbelow = true    -- Split below instead of above
vim.opt.splitright = true    -- Split to the right instead of left
vim.opt.guicursor = "n-v-c:block,i:block-blinkwait300-blinkon200-blinkoff150"
vim.opt.autoindent = true

-- Enable filetype plugins and indentation
vim.cmd("filetype plugin indent on")
