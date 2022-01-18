" GO syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1


" Status line types/signatures
let g:go_auto_type_info = 1

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~#'^\f\+_test\.go$'
    call go#test#Test(0,1)
  elseif l:file =~#'^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"autocmd FileType go nmapo<leader>r :GoRun %<CR>
autocmd FileType go nmap <leader>t <Plug>(go-test)
