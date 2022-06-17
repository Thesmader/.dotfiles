local nmap = require("thesmader.keymap").nmap

vim.diagnostic.config({
	underline = true,
	virtual_text = {
		severity = nil,
		source = "if_many",
		format = nil,
	},
	signs = true,
	float = {
		show_header = true,
		format = function(d)
			local t = vim.deepcopy(d)
			local code = d.code or d.user_data.lsp.code
			if code then
				t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
			end
			return t.message
		end,
	},
	severity_sort = true,
	update_in_insert = false,
})

local goto_opts = {
	wrap = true,
	float = true,
}

nmap({
	"<leader>vn",
	function()
		vim.diagnostic.goto_next(goto_opts)
	end,
})
nmap({
	"<leader>vp",
	function()
		vim.diagnostic.goto_prev(goto_opts)
	end,
})

nmap({
	"<leader>sl",
	function()
		vim.diagnostic.open_float(0, {
			scope = "line",
		})
	end,
})

nmap({
	"<leader>vh",
	function()
		vim.lsp.buf.hover()
	end,
})
