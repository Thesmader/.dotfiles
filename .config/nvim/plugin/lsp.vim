" Nvim LSP
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" let g:neomake_dart_lint_maker = {
  " \ 'exe': 'flutter',
  " \ 'args': ['analyze', 'getCwd()'],
  " \ 'errorformat': '%f:%l:%c:%n: %m', }
" let g:neomake_dart_enabled_makers = ['lint']
let g:completion_confirm_key = ""

" Diagnostics
:lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable diagnostic message updates in insert mode
    update_in_insert = true,
  }
)
EOF

:lua <<EOF
local nvim_lsp = require('lspconfig')
-- local flutter = require('flutter-tools')
local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
local servers = {'dartls', 'tsserver'}
-- for _, lsp in ipairs(servers) do
--  nvim_lsp[lsp].setup{}
--end
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
-- flutter.setup_lsp{
--   on_attach = on_attach,
--   capabilities = capabilities
-- }
nvim_lsp.dartls.setup{
--    on_attach = dart_attach;
    on_attach = require'completion'.on_attach;
    flags = {allow_incremental_sync = true},
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = true,
      outline = true,
      flutterOutline = true,
      suggestFromUnimportedLibraries = true,
      closingLabels = true,
    },
--     handlers = {
--       ['dart/textDocument/publishClosingLabels'] = flutter.closing_tags,
--       ['dart/textDocument/publishOutline'] = flutter.outline
--     },
    capabilities = dart_capabilities;  
}
EOF

" Completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<Plug>(completion_confirm_completion)" : "\<cr>"

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
