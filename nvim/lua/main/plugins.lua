-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- common nvim/lua plugins
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of plugins
  use 'kyazdani42/nvim-web-devicons'

  -- colorschemes
  use 'folke/tokyonight.nvim' -- A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins
  use 'EdenEast/nightfox.nvim' -- A soft dark, fully customizable (Neo)Vim theme, with support for lsp, treesitter and a variety of plugins.
  use { "ellisonleao/gruvbox.nvim" }
  use 'sainnhe/gruvbox-material'
  use 'sainnhe/everforest'
  use 'catppuccin/nvim'

  -- uncategorized
  use {
      'kyazdani42/nvim-tree.lua', -- A file explorer tree for neovim written in lua
      config = function() require'nvim-tree'.setup {
        view = {
          -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
          side = 'right',
        }
      } end
  }
  use 'b3nj5m1n/kommentary' -- Neovim commenting plugin, written in lua
  use {
    'nvim-lualine/lualine.nvim', -- A blazing fast and easy to configure neovim statusline plugin written in pure lua
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'windwp/nvim-autopairs'
  use 'glepnir/dashboard-nvim'
  use 'ellisonleao/glow.nvim' -- A markdown preview directly in your neovim.
  use 'akinsho/bufferline.nvim'
  use 'ray-x/go.nvim'
  use 'vimwiki/vimwiki'
  use 'tpope/vim-eunuch'
  use 'xiyaowong/nvim-transparent'

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  -- auto completion
  use 'hrsh7th/nvim-cmp' -- A completion plugin for neovim coded in Lua
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path' -- nvim-cmp source for path
  use 'hrsh7th/cmp-cmdline' -- nvim-cmp source for vim's cmdline
  use 'saadparwaiz1/cmp_luasnip' -- luasnip (L3MON4D3/LuaSnip) completion source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim builtin LSP client
  use 'hrsh7th/cmp-emoji' --  nvim-cmp source for emoji

  -- snippets
  use 'L3MON4D3/LuaSnip' -- Snippet Engine for Neovim written in Lua
  use 'rafamadriz/friendly-snippets' -- rafamadriz/friendly-snippets

  -- LSP (Language Server Protocol)
  use 'neovim/nvim-lspconfig' -- Plugin that enables LSP in neovim
  use 'williamboman/nvim-lsp-installer' -- Plugin that allows you to seamlessly manage LSP servers locally with :LspInstall

  -- Telescope (Fuzzy finder and more)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Treesitter (syntax highlighting and more)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
end)

