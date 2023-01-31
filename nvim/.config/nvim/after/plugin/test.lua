require("neotest").setup({
  adapters = {
    require 'neotest-dart' {
      command = "dart",
      use_lsp = true,
    }
  }
})
