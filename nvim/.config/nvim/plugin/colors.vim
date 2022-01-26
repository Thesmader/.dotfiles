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

lua << EOF
local catppuccin = require('catppuccin')

catppuccin.setup({
  term_colors = true,
  styles = {
      strings = "italic"
    }
})

EOF

colorscheme catppuccin
