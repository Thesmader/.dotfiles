call plug#begin()

Plug 'davidhalter/jedi-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

Plug 'neoclide/coc.nvim', {'branch':'release'}

" Color schemes
Plug 'ntk148v/vim-horizon'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'

Plug 'preservim/nerdtree'

call plug#end()

set number
set relativenumber
set wrap!

" Colors may not be correct if this is not set
set termguicolors

colorscheme horizon

" lightline
let g:lightline = {'colorscheme': 'horizon'}

" KeyBindings
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K : call <SID>show_documentation()<CR>

function! s:show_documentation()
	if(index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocActionAsync('doHover')
	endif
endfunction

" Highlight configurations
" highlight PmenuSel guibg=#fab28e guifg=#1a1c23
