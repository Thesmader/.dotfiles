require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "rust", "svelte", "astro", "javascript", "typescript", "go" },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     lookahead = true,
  --     keymaps = {
  --       ['aa'] = '@parameter.outer',
  --       ['ia'] = '@parameter.inner',
  --       ['af'] = '@function.outer',
  --       ['if'] = '@function.inner',
  --       ['ac'] = '@class.outer',
  --       ['ic'] = '@class.inner',
  --       ['ii'] = '@conditional.inner',
  --       ['ai'] = '@conditional.outer',
  --       ['il'] = '@loop.inner',
  --       ['al'] = '@loop.outer',
  --       ['at'] = '@comment.outer',
  --     }
  --   },
  --   swap = {
  --     enable = true,
  --     swap_next = {
  --       ['<leader>a'] = '@parameter.inner',
  --     },
  --     swap_previous = {
  --       ['<leader>A'] = '@parameter.inner',
  --     },
  --   }
  -- }
}
