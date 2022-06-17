local _ = require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"go",
		"rust",
		"yaml",
		"norg",
		"tsx",
		"typescript",
		"javascript",
		"python",
		"html",
		"dart",
		"lua",
	},
	highlight = {
		enable = true,
		use_languagetree = false,
		disable = { "json" },
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },

		smart_rename = {
			enable = false,
			keymaps = {
				smart_rename = "grr",
			},
		},
	},

	incremental_selection = {
		enable = true,
	},

	-- textobjects = {
	--   move = {
	--     enable = true,
	--     set_jumps = true,
	--
	--     goto_next_start = {
	--       ["]p"] = "@parameter.inner",
	--       ["]m"] = "@function.outer",
	--       ["]]"] = "@class.outer",
	--     },
	--     goto_next_end = {
	--       ["]M"] = "@function.outer",
	--       ["]["] = "@class.outer",
	--     },
	--     goto_previous_start = {
	--       ["[p"] = "@parameter.inner",
	--       ["[m"] = "@function.outer",
	--       ["[["] = "@class.outer",
	--     },
	--     goto_previous_end = {
	--       ["[M"] = "@function.outer",
	--       ["[]"] = "@class.outer",
	--     },
	--   },
	--   swap = {
	--     enable = true,
	--     swap_next = {
	--       ["<leader>a"] = "@parameter.inner",
	--     },
	--     swap_previous = {
	--       ["<leader>A"] = "@parameter.inner",
	--     },
	--   },
	--   select = {
	--     enable = true,
	--     keymaps = {
	--       ["af"] = "@function.outer",
	--       ["if"] = "@function.inner",
	--
	--       ["ac"] = "@conditional.outer",
	--       ["ic"] = "@conditional.inner",
	--
	--       ["aa"] = "@parameter.outer",
	--       ["ia"] = "@parameter.inner",
	--     },
	--   },
	-- },
})

-- local _ = function(nivm, jivm, sivm)
--   return
-- end
