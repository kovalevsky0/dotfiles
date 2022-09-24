local keymaps_list = require('main.keymaps_list')

local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap Space key as a leader key
keymap("", keymaps_list.leaderKey, "<Nop>", opts)
vim.g.mapleader = " " -- map leader as Space key

-- ==================== Legend ====================
-- "C" - Control key (macOS)
-- "S" - Shift key
-- "<CR>" - pressing Enter

-- ==================== Normal Mode ====================
-- "n" - normal mode

-- Better window navigation
-- C - Control (macOS)
keymap("n", keymaps_list.focusOnLeftWindow, "<C-w>h", opts)
keymap("n", keymaps_list.focusOnBottomWindow, "<C-w>j", opts)
keymap("n", keymaps_list.focusOnTopWindow, "<C-w>k", opts)
keymap("n", keymaps_list.focusOnRightWindow, "<C-w>l", opts)

-- Resize with arrows
keymap("n", keymaps_list.resizeWindowTop, ":resize -2<CR>", opts)
keymap("n", keymaps_list.resizeWindowBottom, ":resize +2<CR>", opts)
keymap("n", keymaps_list.resizeWindowLeft, ":vertical resize -2<CR>", opts)
keymap("n", keymaps_list.resizeWindowRight, ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- S - Shift
keymap("n", keymaps_list.openNextBuffer, ":bnext<CR>", opts)
keymap("n", keymaps_list.openPreviousBuffer, ":bprevious<CR>", opts)
-- Delete (Close) current buffer
keymap("n", keymaps_list.deleteCurrentBuffer, ":bdelete<CR>", opts)


-- ==================== Visual Mode ====================
-- Legend:
-- "v" - visual mode

-- Stay in indent mode while indenting/tabbing
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text/code block up and down
-- keymap("v", "<ALT-j>", ":m .+1<CR>==gi", opts)
-- keymap("v", "<ALT-k>", ":m .-2<CR>==gi", opts)


-- ==================== Telescope ====================
-- find files without showing file preview
keymap("n", keymaps_list.telescopeFindFile, "<cmd> lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- list of buffers (opened files)
keymap("n", keymaps_list.telescopeOpenBuffersList, "<cmd> lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- search (grep)
keymap("n", keymaps_list.telescopeSearch, "<cmd>Telescope live_grep<cr>", opts)


-- ==================== NvimTree ====================
-- toggle file tree sidebar
keymap("n", keymaps_list.nvimTreeToggle, "<cmd> NvimTreeToggle<cr>", opts)
-- toggle file tree sidebar and focus on current opened file (buffer)
keymap("n", keymaps_list.nvimTreeFindFileToggle, "<cmd> NvimTreeFindFileToggle<cr>", opts)


