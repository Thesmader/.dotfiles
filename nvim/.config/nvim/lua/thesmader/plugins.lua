--local fn = vim.fn
--local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--if fn.empty(fn.glob(install_path)) > 0 then
--  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--
--  -- Ref: https://github.com/wbthomason/packer.nvim/issues/739#issuecomment-1019280631
--  vim.o.runtimepath = fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
--end
vim.cmd([[ packadd packer.nvim]])

return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")
		use("nvim-lualine/lualine.nvim")
		use("windwp/nvim-autopairs")
		use("navarasu/onedark.nvim")
		use("nvim-telescope/telescope.nvim")
		use("nvim-telescope/telescope-ui-select.nvim")
		use("elihunter173/dirbuf.nvim")
		use({ "akinsho/flutter-tools.nvim" })
		use("simrat39/rust-tools.nvim")
		-- use 'fatih/vim-go'
		use("tpope/vim-surround")
		use({ "ThePrimeagen/harpoon", requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" } })
		use("ThePrimeagen/git-worktree.nvim")
		use("nvim-lua/popup.nvim")
		use("folke/trouble.nvim")
		use("Neevash/awesome-flutter-snippets")
		use("RobertBrunhage/flutter-riverpod-snippets")
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		use("dart-lang/dart-vim-plugin")
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use({ "nvim-treesitter/nvim-treesitter-textobjects" })
		use("tpope/vim-fugitive")
		use("neovim/nvim-lspconfig")
		use("onsails/lspkind-nvim")
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("saadparwaiz1/cmp_luasnip")
		use("vim-test/vim-test")
		use("L3MON4D3/luasnip")
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use("mfussenegger/nvim-dap")
		use("rcarriga/nvim-dap-ui")
		use("rcarriga/nvim-notify")
		use("theHamsta/nvim-dap-virtual-text")
		use("nvim-telescope/telescope-dap.nvim")
		use("akinsho/toggleterm.nvim")
		use({ "eliasreis54/vim-bloc-plugin" })
		use({ "prettier/vim-prettier", ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" } })
		use({
			"leafOfTree/vim-svelte-plugin",
			ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		})
		use({
			"nvim-neorg/neorg",
			after = { "nvim-treesitter", "telescope" },
			config = function()
				require("neorg").setup({
					load = {
						["core.defaults"] = {},
					},
				})
			end,
			requires = "nvim-lua/plenary.nvim",
		})
		use("jose-elias-alvarez/null-ls.nvim")
		use("MunifTanjim/prettier.nvim")
		use("/Users/mac/dev/personal/stackmap.nvim")
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
})
