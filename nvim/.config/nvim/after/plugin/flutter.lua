local nmap = require("thesmader.keymap").nmap
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local debugger_dir = vim.fn.stdpath("cache") .. "/dart-code"
local debugger_path = debugger_dir .. "/out/dist/debug.js"
vim.g.dart_style_guide = 2
-- vim.g.dart_format_on_save = 1
local dap = require("dap")
dap.adapters.dart = {
	type = "executable",
	command = "node",
	args = { debugger_path, "flutter" },
}

dap.configurations.dart = {
	{
		type = "dart",
		request = "launch",
		name = "Launch flutter",
		dartSdkPath = os.getenv("HOME") .. "/fvm/default/bin/cache/dart-sdk/",
		flutterSdkPath = os.getenv("HOME") .. "/fvm/default",
		program = "${workspaceFolder}/lib/main.dart",
		cwd = "${workspaceFolder}",
	},
}
require("flutter-tools").setup({
	debugger = {
		enabled = true,
		run_via_dap = true,
		register_configurations = function()
			-- local dap = require("dap")
			-- dap.adapters.dart = {
			-- 	type = "executable",
			-- 	command = "node",
			-- 	args = { debugger_path, "flutter" },
			-- }
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
	dev_log = {
		enabled = true,
		open_cmd = "tabedit",
	},
	--[[ dev_tools = {
		autostart = true,
		auto_open_browser = true,
	}, ]]
	lsp = {
		color = {
			enabled = true,
			background = false,
			foreground = false,
			virtual_text = true,
			virtual_text_str = "■",
		},
		capabilities = capabilities,
	},
})

nmap({
	"<leader>fa",
	function()
		vim.cmd([[FlutterRun]])
	end,
})

nmap({
	"<leader>fr",
	function()
		vim.cmd([[FlutterReload]])
	end,
})

nmap({
	"<leader>fR",
	function()
		vim.cmd([[FlutterRestart]])
	end,
})

nmap({
	"<leader>fcp",
	function()
		vim.cmd([[FlutterCopyProfilerUrl]])
	end,
})

nmap({
	"<leader>fq",
	function()
		vim.cmd([[FlutterQuit]])
	end,
})

nmap({
	"<leader>fc",
	function()
		vim.cmd([[FlutterLogClear]])
	end,
})

nmap({
	"<leader>fg",
	function()
		vim.cmd([[FlutterPubGet]])
	end,
})

nmap({
	"<leader>fu",
	function()
		vim.cmd([[FlutterPubUpgrade]])
	end,
})

nmap({
	"<leader>fd",
	function()
		vim.cmd([[FlutterDevices]])
	end,
})
