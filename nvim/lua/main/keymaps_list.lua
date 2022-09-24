-- C - Control (macOS)
-- S - Shift

local M = {
  -- leader key
  leaderKey = "<Space>",
  -- Better window navigation
  focusOnTopWindow = "<C-k>",
  focusOnBottomWindow = "<C-j>",
  focusOnLeftWindow = "<C-h>",
  focusOnRightWindow = "<C-l>",

  -- Resize windows
  resizeWindowTop = "<S-up>",
  resizeWindowBottom = "<S-down>",
  resizeWindowLeft = "<S-left>",
  resizeWindowRight = "<S-right>",

  -- Navigate buffers
  openPreviousBuffer = "<S-l>",
  openNextBuffer = "<S-h>",
  -- Delete (Close) current buffer
  deleteCurrentBuffer = "<C-x>",

  -- Telescope
  telescopeFindFile = "<leader>f",
  telescopeOpenBuffersList = "<leader>g",
  -- grep
  telescopeSearch = "<C-p>",
  -- Telescope: INSERT Mode
  telescopeHistoryNext = "<C-n>", -- put next search string into search bar
  telescopeHistoryPrev = "<C-p>", -- put previous search string into search bar
  telescopeMoveSelectionNext = "<C-j>",
  telescopeMoveSelectionPrev = "<C-k>",
  telescopeClose = "<C-c>",
  telescopeMoveSelectionNextArrowKey = "<Down>",
  telescopeMoveSelectionPrevArrowKey = "<Up>",
  telescopeSelectHorizontal = "<C-x>",
  telescopeSelectVertical = "<C-v>",
  telescopeSelectTab = "<C-t>",
  telescopePrevScrollingUp = "<C-u>",
  telescopePrevScrollingDown = "<C-d>",
  telescopeResultsScrollingUp = "<PageUp>",
  telescopeResultsScrollingDown = "<PageDown>",
  telescopeToggleSelectionAndMoveSelectionWorse = "<Tab>",
  telescopeToggleSelectionAndMoveSelectionBetter = "<S-Tab>",
  telescopeSendToQuickFixListAndOpenQuickFixList = "<C-q>",
  telescopeSendSelectedToQuickFixListAndOpenQuickFixList = "<M-q>",
  telescopeCompleteTag = "<C-l>",
  telescopeWhichKey = "<C-_>",
  -- Telescope: NORMAL mode
  --[[ ["<esc>"] = actions.close,
  ["<CR>"] = actions.select_default,
  ["<C-x>"] = actions.select_horizontal,
  ["<C-v>"] = actions.select_vertical,
  ["<C-t>"] = actions.select_tab,

  ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
  ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
  ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
  ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

  ["j"] = actions.move_selection_next,
  ["k"] = actions.move_selection_previous,
  ["H"] = actions.move_to_top,
  ["M"] = actions.move_to_middle,
  ["L"] = actions.move_to_bottom,

  ["<Down>"] = actions.move_selection_next,
  ["<Up>"] = actions.move_selection_previous,
  ["gg"] = actions.move_to_top,
  ["G"] = actions.move_to_bottom,

  ["<C-u>"] = actions.preview_scrolling_up,
  ["<C-d>"] = actions.preview_scrolling_down,

  ["<PageUp>"] = actions.results_scrolling_up,
  ["<PageDown>"] = actions.results_scrolling_down,

  ["?"] = actions.which_key, ]]

  -- NvimTree
  -- open/close file tree sidebar
  nvimTreeToggle = "<C-n>",
  -- open/close file tree sidebar and focus on current file
  nvimTreeFindFileToggle = "<C-m>",

  -- nvim-cmp
  -- Go to next item in dropdown menu with completions
  cmpSelectPrevItem = '<C-k>',
  -- Go to previous item in dropdown menu with completions
  cmpSelectNextItem = '<C-j>',
  -- Scroll right if text/info inside popup is bigger than size of popup
  cmpScrollDocsRight = '<C-b>',
  -- Scroll left if text/info inside popup is bigger than size of popup
  cmpScrollDocsLeft = '<C-f>',
  -- Show all snippet, buffer and other completions variants without typing
  cmpShowAllCompletions = '<C-Space>',
  -- Close dropdown menu with completions
  cmpCloseDropdown = '<C-e>',

  -- LSP (Language Server Protocol)
  --[[ vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts) ]]
}


return M
