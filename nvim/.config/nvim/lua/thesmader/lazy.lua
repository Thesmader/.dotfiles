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
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'catppuccin/nvim',  name = 'catppuccin' },
  { 'rose-pine/neovim', name = 'rose-pine' },
  'kyazdani42/nvim-web-devicons',
  'mhartington/formatter.nvim',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'theprimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-abolish',
  'tpope/vim-fugitive',
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    init = function()
      require 'git-conflict'.setup()
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    }
  },
  { 'akinsho/flutter-tools.nvim', ft = "dart" },
  'rcarriga/nvim-notify',
  'mfussenegger/nvim-dap',
  { 'leoluz/nvim-dap-go',         ft = "go" },
  'rcarriga/nvim-dap-ui',
  'windwp/nvim-autopairs',
  'robertbrunhage/flutter-riverpod-snippets',
  'numToStr/Comment.nvim',
  'nvim-neotest/neotest',
  'sidlatau/neotest-dart',
  'lewis6991/gitsigns.nvim',
  'nvim-lualine/lualine.nvim',
  'tpope/vim-surround',
  'folke/trouble.nvim',
  'github/copilot.vim',
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
  },
  { 'stevearc/oil.nvim',          config = true },
  {
    'ibhagwan/fzf-lua',
    config = function()
      require 'fzf-lua'.setup()
      require 'fzf-lua'.register_ui_select()
    end
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.opt.conceallevel = 3
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
              workspaces = {
                work = "~/dev/notes/work",
                personal = "~/dev/notes/personal",
              },
            },
          },
          ["core.export"] = {},
        },
      }
    end,
  },
  { 'echasnovski/mini.splitjoin', version = '*', opts = {} }
}

require 'lazy'.setup(plugins)
