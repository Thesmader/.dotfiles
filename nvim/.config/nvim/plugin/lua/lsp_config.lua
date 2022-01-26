local lspconfig = require('lspconfig')
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
   vim.lsp.diagnostic.on_publish_diagnostics, {
     -- Enable diagnostic message updates in insert mode
     update_in_insert = true,
   }
 )

 --require('flutter-tools').setup{
   --debugger = {
     --enabled = true,
     --run_via_dap = true,
     --register_configurations = function (paths)
       --require('dap').configurations.dart = {
       --}
     --end
   --}
 --}

--Dart LSP configuration
local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
--local capablities = require('cmp_nvim_lsp').update_capabilities(dart_capabilities)
--local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
dart_capabilities.textDocument.completion.completionItem.snippetSupport = true
dart_capabilities.textDocument.codeAction = {
  codeActionLiteralSupport = {
    codeActionKind = {
      valueSet = {
        "",
        "quickfix",
        "refactor",
        "refactor.extract",
        "refactor.inline",
        "refactor.rewrite",
        "source",
        "source.organizeImports",
      };
    };
  };
}

lspconfig.dartls.setup {
  flags = {allow_incremental_sync = true},
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    flutterOutline = true,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    insertArgumentPlaceHolders = true
  },
  capabilities = dart_capabilities,
  settings = {
    dart = {
      --completeFunctionCalls = true,
      --previewLsp = true,
    }
  }
}

-- Elixir LSP
lspconfig.elixirls.setup{
  cmd = { "/home/thesmader/Installs/elixir-ls/release/language_server.sh" };
  settings = {
    elixirLS = {
      dialyzerFormat = "dialyxir_long",
      dialyzerWarnOpts = {"error_handling", "no_behaviours", "no_contracts", "no_fail_call", "no_fun_app", "no_improper_lists", "no_match", "no_missing_calls", "no_opaque", "no_return", "no_undefined_callbacks", "no_unused", "underspecs", "unknown", "unmatched_returns", "overspecs", "specdiffs"},
      dialyzerEnabled = true,
      suggestSpecs = true
    }
  }
}

-- CSS LSP
local css_capabilities = vim.lsp.protocol.make_client_capabilities()
css_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
  capabilities = css_capabilities,
}

-- HTML LSP
--Enable (broadcasting) snippet capability for completion
local html_capabilities = vim.lsp.protocol.make_client_capabilities()
html_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
  capabilities = html_capabilities,
}

local sumneko_root_path = '/home/thesmader/Installs/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path.."/main.lua"};
  filetypes = {'lua'};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local servers = {"bashls", "clangd", "vimls", "gopls", "cssls", "html",
"svelte", "tsserver", "rust_analyzer", "ocamlls",}
for _, lsp in ipairs(servers) do
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local updated_capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  lspconfig[lsp].setup {
    capablities = updated_capabilities
  }
end

vim.cmd [[autocmd CursorHold * :lua vim.diagnostic.open_float()]]
--vim.cmd [[autocmd CursorHoldI * silent! :lua vim.lsp.buf.signature_help()]]

-- alternatively you can override the default configs
--require("flutter-tools").setup {
  --flutter_path = "/home/thesmader/dev/env/flutter/bin/flutter", -- <-- this takes priority over the lookup
--}

