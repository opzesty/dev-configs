-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

-- LSP Related plugins
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }

--   use {
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--       "neovim/nvim-lspconfig",
--       "hrsh7th/nvim-cmp",
--       "hrsh7th/cmp-nvim-lsp"
--   }

    use {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "mfussenegger/nvim-lint",
        "rshkarin/mason-nvim-lint"
    }

end)
