local nmap = require("thesmader.keymap").nmap

nmap({
	"<M-j>",
	function()
		if vim.opt.diff:get() then
			vim.cmd([[normal! ]c]])
		else
			vim.cmd([[m .+1<CR>==]])
		end
	end,
})

nmap({
	"<M-k>",
	function()
		if vim.opt.diff:get() then
			vim.cmd([[normal! [c]])
		else
			vim.cmd([[m .-2<CR>==]])
		end
	end,
})

nmap({
	"<leader>vd",
	function()
		vim.lsp.buf.definition()
	end,
})

nmap({
	"<leader>rr",
	function()
		vim.lsp.buf.references()
	end,
})
nmap({
	"<leader>cn",
	function()
          vim.cmd([[cnext]])
	end,
})
nmap({
	"<leader>cp",
	function()
          vim.cmd([[cprevious]])
	end,
})

vim.cmd([[ vnoremap <M-j> :m '>+1<CR>gv=gv ]])
vim.cmd([[ vnoremap <M-k> :m '<-2<CR>gv=gv ]])
