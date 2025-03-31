require("config.lazy")

-- Key Mappings
vim.g.mapleader = " "             -- Set Space as leader key
-- Basic Settings
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Relative line numbers
vim.opt.tabstop = 2               -- Tab size of 2 spaces
vim.opt.shiftwidth = 2            -- Auto-indent size of 2 spaces
vim.opt.expandtab = true          -- Use spaces instead of tab 
vim.opt.smartindent = false        -- Smart auto-indenting
vim.opt.wrap = true              -- Enable line wrapping
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.cursorline = true         -- Highlight current line
vim.opt.termguicolors = true      -- Enable true colors
vim.opt.signcolumn = "yes"        -- Always show sign column
--vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.scrolloff = 8             -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8         -- Keep 8 columns left/right of cursor
vim.opt.ignorecase = true         -- Case insensitive search
vim.opt.smartcase = true          -- Smart case-sensitive search
vim.opt.mouse = "a"               -- Enable mouse support
vim.opt.updatetime = 250         -- Faster update time for better performance
vim.opt.undofile = true           -- Persistent undo history
vim.opt.splitbelow = true         -- Split below instead of above
vim.opt.splitright = true         -- Split to the right instead of left
vim.opt.guicursor = "n-v-c:block,i:block-blinkwait300-blinkon200-blinkoff150"
vim.opt.autoindent = true
vim.cmd("filetype plugin indent on")



-- Save file with Ctrl+S
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":wq<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>c", ":w !clip.exe<CR><CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>c", ":w !clip.exe<CR><CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader><leader>e", ":NvimTreeFocus<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Horizontal Terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle Vertical Terminal" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Floating Terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move Left" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move Right" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move Down" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move Up" })
vim.keymap.set("n", "<leader>tg", "<cmd>TermExec cmd=lazygit direction=tab<CR>", { desc = "Open Lazygit in Terminal" })


local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts);
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, bufopts)


vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
vim.cmd([[colorscheme ayu-dark]])



local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader><space>', vim.lsp.buf.hover, bufopts)
end



-- Remeber last-time cursor postion 
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


vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})


