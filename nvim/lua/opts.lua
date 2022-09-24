vim.g.mapleader = " " -- map leader is Space
vim.g.markdown_conceal = 0

vim.o.hidden = true
--vim.o.mouse = a
vim.o.number = true
vim.o.cursorline = true
vim.o.showtabline = 1
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.completeopt = 'menuone,noselect'

vim.o.encoding = 'utf-8'                     -- The encoding displayed
vim.o.pumheight=10                        -- Makes popup menu smaller
vim.o.fileencoding='utf-8'                 -- The encoding written to file
vim.o.ruler=true              			            -- Show the cursor position all the time
vim.o.cmdheight=2                         -- More space for displaying messages
--vim.o.iskeyword+=-                      	-- treat dash separated words as a word text object"
vim.o.mouse='a'                             -- Enable your mouse
vim.o.splitbelow=true                          -- Horizontal splits will automatically be below
vim.o.splitright=true                          -- Vertical splits will automatically be to the right
--vim.o.t_Co=256                            -- Support 256 colors
vim.o.conceallevel=0                      -- So that I can see `` in markdown files
vim.o.tabstop=2                           -- Insert 2 spaces for a tab
vim.o.shiftwidth=2                        -- Change the number of space characters inserted for indentation
vim.o.smarttab=true                            -- Makes tabbing smarter will realize you have 2 vs 4
vim.o.expandtab=true                          -- Converts tabs to spaces
vim.o.smartindent=true                         -- Makes indenting smart
vim.o.autoindent=true                          -- Good auto indent
--vim.o.laststatus=0                        -- Always display the status line
--vim.g.noshowmode=true                          -- We don't need to see things like -- INSERT -- anymore
--vim.o.nobackup                            -- This is recommended by coc
--vim.o.nowritebackup                       -- This is recommended by coc
vim.o.updatetime=300                      -- Faster completion
vim.o.timeoutlen=500                      -- By default timeoutlen is 1000 ms
--vim.o.formatoptions-=cro                  -- Stop newline continution of comments
vim.o.clipboard='unnamedplus'               -- Copy paste between vim and everything else
vim.o.scrolloff=7

vim.o.termguicolors = true

vim.g.lsp_diagnostics_echo_cursor = true
vim.g.nvim_tree_side = 'right'

-- don't show error message in line
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

-- ------------- diagnostic symbols in the sign column (gutter) -----------------
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
-- ------------- ------------- ------------- -------------  ---------------------

function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  opts = opts or {}

  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)

  local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line_nr, opts, client_id)
  if vim.tbl_isempty(line_diagnostics) then return end

  local diagnostic_message = ""
  for i, diagnostic in ipairs(line_diagnostics) do
    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
    print(diagnostic_message)
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end
  end
  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end

-- Print diagnostics in status line
--vim.cmd [[ autocmd CursorHold * lua PrintDiagnostics() ]]

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

-- colorscheme
--require('tokyonight').set()
-- vim.g.tokyonight_style = 'night' -- it should be before setup colorscheme

vim.g.tokyonight_style = "night"
vim.cmd 'colorscheme tokyonight'

-- lua line (status line)
require("lualine").setup({
  options = {
    theme = "tokyonight",
    icons_enabled = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { { "diagnostics", sources = { "nvim_lsp" } }, "filename" },
    lualine_c = { "filename" },
    lualine_x = { "filetype", lsp_progress },
    lualine_y = { "progress" },
    lualine_z = { clock },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "nvim-tree" },
})

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  ensure_installed = {'javascript'}
}

--------------------------------------------------------
-------------------- LSP COMPLETION --------------------
--------------------------------------------------------

local cmp = require'cmp';

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

      -- For `luasnip` user.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },

    -- For vsnip user.
    -- { name = 'vsnip' },

    -- For luasnip user.
    -- { name = 'luasnip' },

    -- For ultisnips user.
    -- { name = 'ultisnips' },

    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' }
  }
});

--------------------------------------------------------
-------------------- FORMATTING --------------------
--------------------------------------------------------

require('formatter').setup({
  filetype = {
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    typescript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
  }
});

require'colorizer'.setup()

--------------------------------------------------------
-------------------------- FZF -------------------------
--------------------------------------------------------

vim.g.fzf_layout = { down = '~40%' }

