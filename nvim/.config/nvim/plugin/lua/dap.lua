--local dap = require('dap')

--dap.adapters.dart = {
  --type = "executable",
  --command = "node",
  --args = {os.getenv('HOME').."/dev/work/Dart-Code/out/dist/debug.js", "flutter"}
--}

--require('dap.ext.vscode').load_launchjs()
--dap.configurations.dart = {
  --{
    --type = "dart",
    --request = "launch",
    --name = "Launch Flutter",
    --dartSdkPath = os.getenv('HOME').."/fvm/default/bin/flutter/bin/cache/dart-sdk/",
    --flutterSdkPath = os.getenv('HOME').."/fvm/default/bin/flutter/",
    --program = "${workspaceFolder}/lib/main.dart",
    --cwd = "$workspaceFolder",
  --}
--}
