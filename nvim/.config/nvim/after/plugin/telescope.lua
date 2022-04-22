local nmap = require'thesmader.keymap'.nmap
local tb = require'telescope.builtin'

nmap {
  '<leader>ff',
  function()
    tb.find_files()
  end,
}
nmap {
  '<leader>fg',
  function()
    tb.live_grep()
  end,
}
nmap {
  '<leader>fh',
  function()
    tb.help_tags()
  end,
}
nmap {
  '<leader>ca',
  function()
    tb.lsp_code_actions()
  end,
}

nmap {
  '<leader>cra',
  function()
    tb.lsp_range_code_actions()
  end,
}
