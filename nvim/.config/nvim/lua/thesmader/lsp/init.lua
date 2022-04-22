local nmap = require'thesmader.keymap'.nmap
local capabilites = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.hls.setup {
  capabilites = capabilites
}

require'lspconfig'.solidity_ls.setup{}
