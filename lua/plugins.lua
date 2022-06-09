-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Using Packer
  use 'navarasu/onedark.nvim'

  -- LSP Client
  use 'neovim/nvim-lspconfig'

  -- Language Server installer
  use {
    'williamboman/nvim-lsp-installer',
    requires = 'neovim/nvim-lspconfig',
  }

  -- BONUS: Customizations over LSP
  -- Show VSCode-esque pictograms
  use 'onsails/lspkind-nvim'
  -- show various elements of LSP as UI
  use {'tami5/lspsaga.nvim', requires = {'neovim/nvim-lspconfig'}}

  -- Status line
  use 'nvim-lualine/lualine.nvim'
  --- If you want to have icons in your statusline choose one of these
  use 'kyazdani42/nvim-web-devicons'

  -- TreeSitter
  use {
    "nvim-treesitter/nvim-treesitter",
     run = ":TSUpdate",
  }

  -- Autocompletion plugin
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    }
  }

  -- snippets
  use {
    'hrsh7th/cmp-vsnip', requires = {
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets',
    }
  }

  -- fuzzy search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}}
  }

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use { 'mhartington/formatter.nvim' }

  use {'jose-elias-alvarez/null-ls.nvim'}

  use {'alexghergh/nvim-tmux-navigation'}

  use {'Olical/conjure'}
end)

