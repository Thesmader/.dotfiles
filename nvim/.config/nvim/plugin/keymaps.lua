local nmap = require'thesmader.keymap'.nmap

nmap {
  "<M-j>",
  function()
    if vim.opt.diff:get() then
      vim.cmd [[normal! ]c]]
    else
      vim.cmd [[m .+1<CR>==]]
    end
  end,
}

nmap {
  "<M-k>",
  function()
    if vim.opt.diff:get() then
      vim.cmd [[normal! [c]]
    else
      vim.cmd [[m .-2<CR>==]]
    end
  end,
}

nmap {
  '<leader>vd',
  function()
    vim.lsp.buf.definition()
  end
}