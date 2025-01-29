local capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = { buffer = bufnr, remap = false }
vim.keymap.set("n", "<leader>fs", vim.cmd.FlutterRun, opts)
vim.keymap.set("n", "<leader>fr", vim.cmd.FlutterReload, opts)
vim.keymap.set("n", "<leader>fR", vim.cmd.FlutterRestart, opts)
vim.keymap.set("n", "<leader>fp", vim.cmd.FlutterCopyProfilerUrl, opts)
vim.keymap.set("n", "<leader>fc", vim.cmd.FlutterLogClear, opts)
vim.keymap.set("n", "<leader>fq", vim.cmd.FlutterQuit, opts)

require("flutter-tools").setup({
	debugger = {
		enabled = true,
		run_via_dap = true,
		register_configurations = function()
			local dir = vim.fn.getcwd()
			if vim.fn.filereadable(dir .. "/.vscode/launch.json") ~= 0 then
				require("dap").configurations.dart = {}
				require("dap.ext.vscode").load_launchjs()
			end
		end,
	},
	fvm = true,
	decorations = {
		statusline = {
			device = true,
		},
	},
	dev_tools = {
		autostart = true,
	},
	dev_log = {
		enabled = true,
		open_cmd = "tabedit",
	},
	lsp = {
		color = {
			enabled = true,
			background = false,
			foreground = false,
			virtual_text = true,
			virtual_text_str = "■",
		},
		capabilities = capabilities,
		settings = {
			lineLength = 100,
		},
	},
})
