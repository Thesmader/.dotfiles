local nmap = require("thesmader.keymap").nmap

require("git-worktree").setup({})

nmap({
	"<leader>wc",
	function()
		require("telescope").extensions.git_worktree.create_git_worktree()
	end,
})

nmap({
	"<leader>ww",
	function()
		require("telescope").extensions.git_worktree.git_worktrees()
	end,
})
