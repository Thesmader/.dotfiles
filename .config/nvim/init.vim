set exrc
set ignorecase
call plug#begin()
" Plug '$HOME/dev/nvim_plugs/pubspec-assist.vim'
Plug '$HOME/dev/nvim_plugs/ghcli.nvim'
Plug 'andweeb/presence.nvim'
Plug 'vimwiki/vimwiki'
Plug 'ThePrimeagen/vim-be-good'
Plug 'tpope/vim-dispatch'
Plug 'wakatime/vim-wakatime'
Plug 'mattn/webapi-vim'
Plug 'vim-scripts/AnsiEsc.vim'
" Plug 'vim-scripts/DrawIt'
" Plug 'euclidianAce/BetterLua.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'anott03/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'vim-test/vim-test'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'jiangmiao/auto-pairs'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Neevash/awesome-flutter-snippets'
Plug 'RobertBrunhage/flutter-riverpod-snippets'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
call plug#end()

let g:custom_path = '~/.config/nvim/plugin/'
" Remove trailing whitespaces in specified filetypes
autocmd FileType dart autocmd BufWritePre <buffer> %s/\s\+$//e
" autocmd! FileType dart autocmd BufWritePost,BufEnter Neomake! lint<CR>
syntax on
filetype plugin indent on

let g:switch_mapping = ""
nnoremap <leader>t :Switch<CR>

" NerdCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

" ColorScheme Configuration
" :lua require('colorbuddy').colorscheme('gruvbuddy')
if(has("termguicolors"))
  set termguicolors
endif

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
colorscheme gruvbox
hi Comment cterm=italic gui=italic
hi Normal guibg=NONE ctermbg=NONE

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch' : 'FugitiveHead'
      \ }
      \ }

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

" Keymaps
imap jk <Esc>
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
nnoremap <SPACE> <Nop>
let mapleader=" "

" Use K to show documentation in preview window
nnoremap <silent> K : call <SID>show_documentation()<CR>

function! s:show_documentation()
  if(index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

function! OpenUrlUnderCursor()
  let s:uri = expand('<cWORD>')
  let s:uri = substitute(s:uri, '?', '\\?', '')
  let s:uri = shellescape(s:uri, 1)
  if s:uri != ''
    silent exec "!xdg-open '".s:uri."'"
  endif
endfunction
nnoremap gx :call OpenUrlUnderCursor()<CR>
