exec 'luafile' expand(g:custom_path . '../lua/thesmader/telescope.lua')
lua require('thesmader.telescope')

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>")}<CR><CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>vca :lua require('telescope.builtin').lsp_code_actions()<CR>
nnoremap <leader>vrc :lua require('thesmader.telescope').search_nvim_config()<CR>
nnoremap <leader>gc :lua require('thesmader.telescope').git_branches()<CR>
