local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

	-- lua functions that many plugins are
	"nvim-lua/plenary.nvim",

	"bluz71/vim-nightfly-guicolors",

	-- tmux & split window navigation
	"christoomey/vim-tmux-navigator",

	-- maximizes and restores current window
	"szw/vim-maximizer",

	-- essential plugins
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",

	-- commenting with gc
	"numToStr/Comment.nvim",

	-- file explorer
	"nvim-tree/nvim-tree.lua",

	-- icons
	"kyazdani42/nvim-web-devicons",

	-- statusline
	"nvim-lualine/lualine.nvim",

	-- fuzzy finding
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },

	-- autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

	-- snippers
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- managing & installing lsp servers
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- configuring lsp servers
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	{ "glepnir/lspsaga.nvim", branch = "main" },
	"jose-elias-alvarez/typescript.nvim",
	"onsails/lspkind.nvim",

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- auto closing
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	-- git signs
	"lewis6991/gitsigns.nvim",

	-- clojure
	"Olical/conjure",
  "tpope/vim-sexp-mappings-for-regular-people",
  "tpope/vim-repeat",
  "guns/vim-sexp",

	-- java jdtls
	"mfussenegger/nvim-jdtls",

  -- rust
  "simrat39/rust-tools.nvim",

  -- debugging
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "jay-babu/mason-nvim-dap.nvim",
  "mfussenegger/nvim-dap-python",
  "theHamsta/nvim-dap-virtual-text",
  "nvim-telescope/telescope-dap.nvim",
  "nvim-lua/popup.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)

