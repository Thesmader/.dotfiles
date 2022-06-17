vim.g.mapleader = ","
--vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
require("thesmader.plugins")
require("thesmader.disable_builtin")
require("thesmader.keymap")
require("thesmader.lsp")
require("thesmader.globals")
