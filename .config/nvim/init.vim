set exrc
set ignorecase
call plug#begin()
" Plug '$HOME/dev/nvim_plugs/pubspec-assist.vim'

Plug 'folke/lsp-trouble.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'glepnir/galaxyline.nvim'
" Plug 'mattn/emmet-vim'
" Plug 'AndrewRadev/tagalong.vim'
" Plug 'alvan/vim-closetag'
Plug 'elixir-editors/vim-elixir'
Plug '$HOME/dev/nvim_plugs/ghcli.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sainnhe/gruvbox-material'
Plug 'andweeb/presence.nvim'
Plug 'vimwiki/vimwiki'
Plug 'ThePrimeagen/vim-be-good'
Plug 'tpope/vim-dispatch'
Plug 'wakatime/vim-wakatime'
Plug 'mattn/webapi-vim'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'gruvbox-community/gruvbox'
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
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'akinsho/nvim-toggleterm.lua'
call plug#end()

if(has("termguicolors"))
  set termguicolors
endif
" Path to the plugin configuration files written in lua.
let g:custom_path = '~/.config/nvim/plugin/'

" Remove trailing whitespaces in specified filetypes
au FileType dart autocmd BufWritePre <buffer> %s/\s\+$//e

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir

syntax on
filetype plugin indent on

" LSP Trouble

:lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

let g:switch_mapping = ""
nnoremap <leader>t :Switch<CR>

nmap <M-t> <C-w>+
nmap <M-s> <C-w>-


"Colorizer
:lua require'colorizer'.setup()

" Statusline
:lua require('lualine').setup{ options = { theme = require'lualine.themes.gruvbox_material', section_separators = {'', ''}, component_separators = {'|', '|'} } }

" Web development stuff

"Emmet
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall
  let g:user_emmet_leader_key=','
" tagalong
  let g:tagalong_verbose = 1

" Easy splits with <C-dirn>
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

function! OpenUrlUnderCursor()
  let s:uri = expand('<cWORD>')
  let s:uri = substitute(s:uri, '?', '\\?', '')
  let s:uri = shellescape(s:uri, 1)
  if s:uri != ''
    silent exec "!xdg-open '".s:uri."'"
  endif
endfunction
nnoremap gx :call OpenUrlUnderCursor()<CR>



