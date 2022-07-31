local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup({
	diagnostics = {
		globals = { "vim", "augroup" },
	},
	telemetry = {
		enable = false,
	},
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.hls.setup({
	capabilities = capabilities,
})

lspconfig.solidity_ls.setup({})

lspconfig.gopls.setup({})

lspconfig.svelte.setup({})

-- lspconfig.rust_analyzer.setup{}
require("rust-tools").setup({})

lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
})

lspconfig.tsserver.setup({
	on_attach = function(client, _)
		if client.name == "tsserver" then
			client.server_capabilities.document_formatting = false
		end
	end,
	init_options = {
		preferences = {
			includeCompletionsWithSnippetText = true,
			includeCompletionsForImportStatements = true,
		},
	},
})
