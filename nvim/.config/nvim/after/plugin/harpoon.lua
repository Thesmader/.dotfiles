-- local harpoon = require 'harpoon'
--
-- harpoon:setup()
--
-- vim.keymap.set('n', '<leader>a', function() harpoon:list():append() end)
-- vim.keymap.set('n', '<leader>u', function() harpoon.ui:toggle_quick_menu() end)
local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>u", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end)
