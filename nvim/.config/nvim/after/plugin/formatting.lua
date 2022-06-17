local nmap = require("thesmader.keymap").nmap
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local sources = {
	formatting.stylua,
	formatting.prettierd,
	formatting.dart_format,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})

nmap({
	"<leader>f",
	function()
		vim.lsp.buf.format()
	end,
})
