local ls = require("luasnip")
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynode = ls.dynamic_node

local date = function()
	return { os.date("%b %d, %Y") }
end

local M = {}

M.snippets = {
	all = {
		snip({
			trig = "date",
			namr = "Date",
			dscr = "Date in the form of Oct 08, 2022",
		}, {
			func(date, {}),
		}),
	},
	markdown = {
		snip({
			trig = "link",
			name = "markdown_link",
			dscr = "Create markdown link [txt](url)",
		}, {
			text("["),
			insert(1),
			text("]("),
			func(function(_, sn)
				return sn.env.TM_SELECTED_TEXT[1] or {}
			end, {}),
			text(")"),
			insert(0),
		}),
	},
}

return M
