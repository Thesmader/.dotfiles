local dap = require('dap')

dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = {"/home/thesmader/dev/env/dartcode/out/dist/debug.js", "flutter"}
}

dap.configurations.dart = {
  {
    type = "flutter",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = os.getenv('HOME').."/dev/env/flutter/bin/cache/dart-sdk/",
    flutterSdkPath = os.getenv('HOME').."/dev/env/flutter",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
  }
}
