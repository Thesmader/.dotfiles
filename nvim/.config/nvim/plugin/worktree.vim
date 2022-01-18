nnoremap <leader>gt :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <leader>t :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>

":lua << EOF
"local Worktree = require('git-worktree')
"Worktree.on_tree_update(function(op, metadata) 
  "if(op == 'Switch') then
    "if string.find(metadata.path, "pings-app") then
      "vim.api.nvim_command('cd :%p:h/pings/')
    "end
  "end
"end)
"EOF
