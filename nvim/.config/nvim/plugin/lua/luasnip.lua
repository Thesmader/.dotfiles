local ls = require'luasnip'
local s = ls.s
--local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
--local c = ls.c
--local d = ls.d

local function copy(args)
	return args[1]
end

ls.snippets = {
  all = {},
  dart = {
      s({trig = 'fn'}, {
      t({"/// function: "}),
      f(copy, {1}),
      t({"","/// "}),
      f(copy, {2}),
      t({"","void "}),
      i(1),
      t({"("}),
      i(2, {"int x"}),
      t({") {", "\t"}),
      i(0),
      t({"", "}"}),
    }),
  }
}

-- In Insert
vim.cmd([[inoremap <c-l> <cmd>lua require'luasnip'.jump(1)<CR>]])
vim.cmd([[inoremap <c-j> <cmd>lua require'luasnip'.jump(-1)<CR>]])

-- In select
vim.cmd([[snoremap <silent> <c-l> <cmd>lua require'luasnip'.jump(1)<CR>]])
vim.cmd([[snoremap <silent> <c-j> <cmd>lua require'luasnip'.jump(-1)<CR>]])
