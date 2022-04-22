vim.cmd [[ packadd packer.nvim]]

require'nvim-autopairs'.setup{}

return require'packer'.startup {
  function(use)
    use 'wbthomason/packer.nvim'
    use 'windwp/nvim-autopairs'
    use 'navarasu/onedark.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'elihunter173/dirbuf.nvim'
    use { 'akinsho/flutter-tools.nvim'}
    use 'fatih/vim-go'
    use 'tpope/vim-surround'
    use {'ThePrimeagen/harpoon', requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" }}
    use 'nvim-lua/popup.nvim'
    use 'folke/trouble.nvim'
    use 'Neevash/awesome-flutter-snippets'
    use 'RobertBrunhage/flutter-riverpod-snippets'
    use {
      'numToStr/Comment.nvim',
      config = function ()
        require'Comment'.setup()
      end
    }
    use 'dart-lang/dart-vim-plugin'
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use 'tpope/vim-fugitive'
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'
    use 'vim-test/vim-test'
    use 'L3MON4D3/luasnip'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = "make"}
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'akinsho/toggleterm.nvim'
    use{ 'eliasreis54/vim-bloc-plugin'}
    use { 'prettier/vim-prettier', ft = {'typescript', 'typescriptreact', 'javascript', 'javascriptreact'}}
    use { 'leafOfTree/vim-svelte-plugin', ft = {'typescript', 'typescriptreact', 'javascript', 'javascriptreact'}}
    use {
      'nvim-neorg/neorg', 
      config = function()
        require'neorg'.setup {
          load = {
            ['core.defaults'] = {}
          }
        }
      end,
      requires = 'nvim-lua/plenary.nvim'
    }
  end
}
