local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'folke/tokyonight.nvim'
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use 'akinsho/flutter-tools.nvim'
  use 'rcarriga/nvim-notify'
  use 'mfussenegger/nvim-dap'
  use 'windwp/nvim-autopairs'
  use 'robertbrunhage/flutter-riverpod-snippets'
  use 'numToStr/Comment.nvim'
  use 'nvim-neotest/neotest'
  use 'sidlatau/neotest-dart'
  use 'lewis6991/gitsigns.nvim'
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'tpope/vim-surround'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
