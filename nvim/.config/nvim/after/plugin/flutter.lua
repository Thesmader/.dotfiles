local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

require 'flutter-tools'.setup({
  debugger = {
    enabled = true,
    run_via_dap = true,
    register_configurations = function()
      local dir = vim.fn.getcwd()
      if (vim.fn.filereadable(dir .. '/.vscode/launch.json') ~= 0) then
        require 'dap'.configurations.dart = {}
        require 'dap.ext.vscode'.load_launchjs()
      end
    end,
  },
  fvm = true,
  decorations = {
    statusline = {
      device = true
    }
  },
  dev_tools = {
    autostart = true,
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabedit"
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
    }
  },
})
