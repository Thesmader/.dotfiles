require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "rust", "svelte", "astro", "javascript", "typescript", "go" },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
}
