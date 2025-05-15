-- File operations
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":wq<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q!<CR>", { noremap = true, silent = true })

-- Clear search highlight
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })

-- Clipboard operations

if vim.loop.os_uname().sysname == "Windows_NT" then
  -- Windows keymap
  vim.api.nvim_set_keymap("n", "<leader>c", ":w !clip.exe<CR><CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<leader>c", ":w !clip.exe<CR><CR>", { noremap = true, silent = true })
elseif vim.fn.has("unix") == 1 and os.getenv("PREFIX") == "/data/data/com.termux/files/usr" then
  -- Termux keymap
  vim.api.nvim_set_keymap("v", "<leader>c", ":w !termux-clipboard-set<CR><CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>c", ":w !termux-clipboard-set<CR><CR>", { noremap = true, silent = true })
end

-- NvimTree
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>e", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

-- Terminal mappings
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

-- Buffer navigation
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bw', ':bdelete!<CR>', { noremap = true, silent = true })


-- Noice plugin mappings
vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { desc = "Dismiss all notifications" })

vim.keymap.set('v', '<leader>p', '"_dP', { noremap = true, silent = true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })


vim.keymap.set("v", "<leader>w", "J", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>sw2", ":set shiftwidth=2<CR>", { noremap = true, silent = true, desc = "Set shiftwidth to 2" })
vim.keymap.set("n", "<leader>sw4", ":set shiftwidth=4<CR>", { noremap = true, silent = true, desc = "Set shiftwidth to 4" })
