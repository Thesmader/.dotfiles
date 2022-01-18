exec 'luafile' expand(g:custom_path . 'lua/lsp_config.lua')

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vsd :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vp :lua vim.lsp.diagnostic.goto_prev()<CR>
