local dap = require("dap")

local debugger_path = os.getenv("HOME") .. ".local/share/nvim/mason/packages/dart-debug-adapter/extension/out/dist/debug.js"

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
