local nmap = require("thesmader.keymap").nmap
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local sources = {
	formatting.stylua,
	formatting.prettierd,
	formatting.dart_format,
	formatting.rustfmt,
}

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end
null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})

nmap({
	"<leader>f",
	lsp_formatting,
})
