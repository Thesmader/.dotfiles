vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

require 'gitsigns'.setup({
  current_line_blame = true,
})

require 'neogit'.setup({
  disable_hint = false,
  kind = "vsplit",
  signs = {
    -- { CLOSED, OPENED }
    hunk = { "", "" },
    item = { "▷", "▽" },
    section = { "▷", "▽" },
  },
  integrations = {
    telescope = false,
    diffview = true
  }
})
