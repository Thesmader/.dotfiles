local nmap = require("thesmader.keymap").nmap
local tb = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"yarn.lock",
			"package-lock.json",
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
			path = "%:p:h",
		},
	},
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("file_browser")

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

nmap({
	"<leader>fb",
	":Telescope file_browser<CR>",
})
