set completeopt=menuone,noselect
" Most of the compe config is in the lua file.
exec 'luafile' expand(g:custom_path . 'lua/compe.lua')

inoremap <silent><expr> <CR> compe#confirm('<CR>')
