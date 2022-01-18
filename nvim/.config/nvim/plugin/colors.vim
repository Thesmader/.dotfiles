" ColorScheme Configuration

hi Normal guibg=NONE ctermbg=NONE

let g:onedark_config = {
  \ 'style': 'darker',
  \ 'toggle_style_key': '<leader>ts',
  \ 'diagnostics': {
    \ 'darker': v:false,
    \ 'background': v:false
    \},
  \ 'code_style': {
    \ 'comments': 'italic'
    \}
  \}

set background=dark
"let g:onedark_italic_comment = v:true
"let g:onedark_toggle_style_key = '<leader>pl'
"let g:onedark_disable_terminal_colors = v:true
colorscheme onedark
