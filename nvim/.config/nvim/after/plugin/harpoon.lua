local nmap = require("thesmader.keymap").nmap
require("harpoon").setup({})
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

nmap({
	"<leader>a",
	function()
		mark.add_file()
	end,
})
nmap({
	"<leader>u",
	function()
		ui.toggle_quick_menu()
	end,
})
nmap({
	"<C-h>",
	function()
		ui.nav_file(1)
	end,
})
nmap({
	"<C-j>",
	function()
		ui.nav_file(2)
	end,
})
nmap({
	"<C-k>",
	function()
		ui.nav_file(3)
	end,
})
nmap({
	"<C-l>",
	function()
		ui.nav_file(4)
	end,
})
