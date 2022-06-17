local has_dap, dap = pcall(require, "dap")
if not has_dap then
	return
end

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/env/web/vscode-chrome-debug/out/src/chromeDebug.js" },
}

dap.configurations.typescriptreact = {
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

require("nvim-dap-virtual-text").setup({
	enabled = true,
	enabled_commands = false,
	highlight_changed_variables = true,
	highlight_new_as_changed = true,
	show_stop_reason = true,
	virt_text_pos = "eol",
	all_frames = false,
})

local map = function(lhs, rhs, desc)
	if desc then
		desc = "[DAP] " .. desc
	end

	vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

map("<leader>dB", require("dap").step_back, "step back")
map("<leader>di", require("dap").step_into, "step into")
map("<leader>do", require("dap").step_over, "step over")
map("<leader>dO", require("dap").step_out, "step out")
map("<leader>dc", require("dap").continue, "continue")
map("<leader>dr", require("dap").repl.toggle)
map("<leader>db", require("dap").toggle_breakpoint)
map("<leader>dcb", function()
	require("dap").set_breakpoint(vim.fn.input("[DAP] Counter > "))
end)
map("<leader>de", require("dapui").eval, "Evaluate")
map("<leader>dE", function()
	require("dapui").eval(vim.fn.input("[DAP] Expression >"))
end, "Evaluate expression")
map("<leader>du", function()
	require("dapui").toggle()
end, "Toggle UI")

vim.cmd([[
augroup DapRepl
  au!
  au FileType dap-repl lua require('dap.ext.autocompl').attach()
augroup END
]])
