set exrc
set ignorecase
call plug#begin()
" Plug '$HOME/dev/nvim_plugs/pubspec-assist.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'vimwiki/vimwiki'
Plug 'ThePrimeagen/vim-be-good'
Plug 'tpope/vim-dispatch'
Plug 'wakatime/vim-wakatime'
Plug 'mattn/webapi-vim'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'vim-scripts/DrawIt'
Plug 'euclidianAce/BetterLua.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
" Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'anott03/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'vim-test/vim-test'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'jiangmiao/auto-pairs'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Neevash/awesome-flutter-snippets'
Plug 'RobertBrunhage/flutter-riverpod-snippets'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sonph/onehalf', { 'rtp' : 'vim' }
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
colorscheme gruvbox
if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let gruvbox_contrast_dark = 'hard'
let gruvbox_invert_selection = '0'
hi Comment cterm=italic gui=italic
hi Normal guibg=NONE ctermbg=NONE
" Colors may not be correct if this is not set
" let ayucolor="dark"

" lightline
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
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
