local opt = vim.opt
--vim.notify = require("notify")

vim.cmd([[set listchars=tab:→\ ,nbsp:␣,trail:•,eol:↲,precedes:«,extends:»]])
vim.cmd([[
  if(has('termguicolors'))
    set termguicolors
  endif
]])
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

opt.wrap = false
opt.errorbells = false
opt.hlsearch = false
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.nu = true
opt.ignorecase = true
opt.smartcase = true
opt.rnu = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.incsearch = true
opt.colorcolumn = "100"
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 10
opt.secure = true
opt.list = true
opt.laststatus = 3
opt.smartcase = true
opt.concealcursor = "nc"
-- opt.conceallevel = 3
