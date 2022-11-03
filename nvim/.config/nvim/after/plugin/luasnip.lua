local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
local snips = require("thesmader.snippets").snippets

ls.config.set_config({
	store_selection_keys = "<c-s>",
})

ls.add_snippets("all", {
	ls.parser.parse_snippet("rup", "₹"),
})

ls.add_snippets("all", snips.all)
ls.add_snippets("markdown", snips.markdown)

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
