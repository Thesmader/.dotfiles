vim.g.mapleader = ","
vim.cmd([[
  let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
]])
--vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
require("thesmader.plugins")
require("thesmader.disable_builtin")
require("thesmader.keymap")
require("thesmader.lsp")
require("thesmader.globals")
