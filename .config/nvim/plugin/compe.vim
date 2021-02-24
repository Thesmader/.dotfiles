set completeopt=menuone,noselect
exec 'luafile' expand(g:custom_path . 'lua/compe.lua')

inoremap <silent><expr> <CR> compe#confirm('<CR>')
