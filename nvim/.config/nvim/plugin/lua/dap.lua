--local dap = require('dap')
local dap_install = require('dap-install')

dap_install.setup({})
dap_install.config('dart', {
  adapters = {
    type = 'executable',
    command = 'node',
  },
  configurations = {
    {
      type = 'flutter',
      request = 'launch',
      name = 'Launch Flutter',
      dartSdkPath = '/home/thesmader/fvm/default/bin/dart',
      flutterSdkPath = '/home/thesmader/fvm/default/bin/flutter',
      program = '${workspaceFolder}/lib/main.dart',
    }
  }
})

--dap.adapters.dart = {
  --type = "executable",
  --command = "node",
  --args = {"/home/thesmader/dev/env/dartcode/out/dist/debug.js", "flutter"}
--}

--dap.configurations.dart = {
  --{
    --type = "flutter",
    --request = "launch",
    --name = "Launch flutter",
    --dartSdkPath = os.getenv('HOME').."/dev/env/flutter/bin/cache/dart-sdk/",
    --flutterSdkPath = os.getenv('HOME').."/dev/env/flutter",
    --program = "${workspaceFolder}/lib/main.dart",
    --cwd = "${workspaceFolder}",
  --}
--}
