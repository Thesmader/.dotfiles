:let g:netrw_rmdir_cmd='rm -r'

set exrc
set ignorecase
call plug#begin()
" Plug '$HOME/dev/nvim_plugs/pubspec-assist.vim'
Plug '$HOME/dev/nvim_plugs/oldfiles.vim'
Plug '$HOME/dev/personal/ghcli'
Plug '$HOME/dev/work/flutter-tools.nvim'

Plug 'tjdevries/nlua.nvim'
Plug 'fatih/vim-go'
Plug 'vuciv/vim-bujo'
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/vim-be-good'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'folke/lsp-trouble.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'alvan/vim-closetag'
Plug 'elixir-editors/vim-elixir'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sainnhe/gruvbox-material'
Plug 'arzg/vim-colors-xcode'
Plug 'andweeb/presence.nvim'
Plug 'vimwiki/vimwiki'
Plug 'mattn/webapi-vim'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'Neevash/awesome-flutter-snippets'
Plug 'RobertBrunhage/flutter-riverpod-snippets'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/playground'
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
Plug 'L3MON4D3/luasnip'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'akinsho/nvim-toggleterm.lua'

Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'html', 'jsx', 'tsx',
      \ 'json', 'svelte']}
Plug 'leafOfTree/vim-svelte-plugin'
call plug#end()

if(has("termguicolors"))
  set termguicolors
endif

" Path to the plugin configuration files written in lua.
let g:custom_path = '~/.config/nvim/plugin/'

" Remove trailing whitespaces in specified filetypes
"au FileType dart,lua autocmd BufWritePre <buffer> %s/\s\+$//e

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir

syntax on
filetype plugin indent on

" LSP Trouble

:lua << EOF
  require("trouble").setup {}
EOF

let g:switch_mapping = ""
nnoremap <leader>t :Switch<CR>

nmap <M-t> <C-w>+
nmap <M-s> <C-w>-

nmap <leader>ba <Plug>BujoAddnormal
imap <C-s> <Plug>BujoAddinsert

nmap <leader>bc <Plug>BujoChecknormal
imap <C-s> <Plug>BujoCheckinsert

"Colorizer
:lua require'colorizer'.setup()

" Statusline
:lua require('lualine').setup{ options = { theme = require'lualine.themes.gruvbox_material', section_separators = {'', ''}, component_separators = {'|', '|'} } }

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


" Keymaps for splitting and leader keys
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

" html stuff
let g:tagalong_additional_filetypes = ['tsx']
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = ','
autocmd FileType html,css,tsx,jsx,js,svelte EmmetInstall

autocmd BufWritePre *.css,*.svelte,*.tsx,*.html,*.jsx,*.json PrettierAsync 
nnoremap <leader>p :PrettierAsync<cr>

let g:vim_svelte_plugin_use_typescript = 1
