local nmap = require("thesmader.keymap").nmap
local tb = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("git_worktree")

nmap({
	"<leader>ff",
	function()
		tb.find_files()
	end,
})
nmap({
	"<leader>fg",
	function()
		tb.live_grep()
	end,
})
nmap({
	"<leader>fh",
	function()
		tb.help_tags()
	end,
})
nmap({
	"<leader>ca",
	function()
		vim.lsp.buf.code_action()
	end,
})

nmap({
	"<leader>cra",
	function()
		tb.lsp_range_code_actions()
	end,
})
