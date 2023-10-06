local dap = require("dap")
local dapui = require 'dapui'

local debugger_path = os.getenv("HOME") ..
    ".local/share/nvim/mason/packages/dart-debug-adapter/extension/out/dist/debug.js"

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
  }
}

vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '🛑', texthl = '', linehl = '', numhl = '' })

dapui.setup()

vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end)
vim.keymap.set("n", "<leader>do", function() dap.step_over() end)
vim.keymap.set("n", "<leader>di", function() dap.step_into() end)
vim.keymap.set("n", "<leader>dO", function() dap.step_out() end)
vim.keymap.set("n", "<leader>du", function() dapui.toggle() end)
