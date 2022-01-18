local actions = require('telescope.actions')

require('telescope').setup {

  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '|>',
    color_devicons = true,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    file_ignore_patterns = { "plugged", "node_modules", "deps", "_build" },

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      }
    }
  },
  extensions = {
    fzf = {
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}


require('telescope').load_extension('fzy_native')
require('telescope').load_extension('git_worktree')
--require('telescope').load_extension('flutter')

local thesmader = {}
thesmader.search_nvim_config = function()
  require("telescope.builtin").find_files({
    prompt_title = "< NVIM CONFIG >",
    cwd = "/home/thesmader/.config/nvim/",
  })
end

thesmader.git_branches = function()
  require('telescope.builtin').git_branches({
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<c-d>', actions.git_delete_branch)
      map('n', '<c-d>', actions.git_delete_branch)
      return true
    end
  })
end

return thesmader
