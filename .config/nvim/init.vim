call plug#begin()

Plug 'davidhalter/jedi-vim'
Plug 'dart-lang/dart-vim-plugin'
"Plug 'thosakwe/vim-flutter'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch':'release'}
" Color schemes
Plug 'ntk148v/vim-horizon'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'natebosch/vim-lsc'
"Plug 'natebosch/vim-lsc-dart'
"Plug 'arcticicestudio/nord-vim'
"Plug 'cocopon/iceberg.vim'
"Plug 'preservim/nerdcommenter'
"Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'

call plug#end()


" TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "dart",
    highlight = {
        enable = true,
    },
}
EOF

" ALE
let g:ale_fixers = {
            \ 'dart': ['dartfmt'],
            \}

" VIM LSC
let g:lsc_auto_map = v:true

syntax on
filetype plugin on

" Sets
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set number
set relativenumber
set cursorline

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
	if (match(a:key, '[jk]'))
	    wincmd v
	else
	    wincmd s
	endif
	exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

nnoremap <SPACE> <Nop>
let mapleader=" "


" Colors may not be correct if this is not set
set termguicolors

colorscheme horizon 

" lightline
let g:lightline = {
	\ 'colorscheme': 'horizon',
	\ }

" KeyBindings
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
"nmap <silent> <C-p>

" FZF
nnoremap <silent> <C-p> :FZF<cr>

" Flutter
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
