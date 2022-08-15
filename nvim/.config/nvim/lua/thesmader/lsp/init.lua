local lspconfig = require("lspconfig")

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end
  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.uri, "%.d.ts") == nil
end

lspconfig.sumneko_lua.setup({
  diagnostics = {
    globals = { "vim", "augroup" },
  },
  telemetry = {
    enable = false,
  },
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.hls.setup({
  capabilities = capabilities,
})

lspconfig.solidity_ls.setup({})

lspconfig.gopls.setup({})

lspconfig.svelte.setup({})

lspconfig.tailwindcss.setup({})

-- lspconfig.rust_analyzer.setup{}
require("rust-tools").setup({})

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
})

lspconfig.tsserver.setup({
  on_attach = function(client, _)
    if client.name == "tsserver" then
      client.server_capabilities.document_formatting = false
    end
  end,
  handlers = {
    ["textDocument/definition"] = function(err, result, method, ...)
      if vim.tbl_islist(result) and #result > 1 then
        local filtered_result = filter(result, filterReactDTS)
        return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
      end
      vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
    end,
  },
  init_options = {
    preferences = {
      includeCompletionsWithSnippetText = true,
      includeCompletionsForImportStatements = true,
    },
  },
})
