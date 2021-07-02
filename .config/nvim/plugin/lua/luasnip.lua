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

