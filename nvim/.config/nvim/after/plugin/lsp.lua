local lsp = require 'lsp-zero'
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'sumneko_lua',
  'rust_analyzer',
})

lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

require 'nvim-autopairs'.setup({
  enable_check_bracket_line = false,
  fast_wrap = {
    map = '<leader>e',
  }
})

local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-Space>'] = cmp.mapping.complete(),
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-y>"] = cmp.mapping(
    cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    { "i", "c" }
  ),
  ["<C-space>"] = cmp.mapping({
    i = cmp.mapping.complete(),
    c = function(
      _ --[[fallback]]
    )
      if cmp.visible() then
        if not cmp.confirm({ select = true }) then
          return
        end
      else
        cmp.complete()
      end
    end,
  }),
})

local cmp_config = lsp.defaults.cmp_config({
  mapping = cmp_mappings,
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
})

cmp.setup(cmp_config)


lsp.set_preferences({
  sign_icons = {}
})

local opts = { buffer = bufnr, remap = false }
vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "<leader>vh", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>sl", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "<leader>vn", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "<leader>vp", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

lsp.setup()

local format_group = vim.api.nvim_create_augroup('Packer', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = format_group,
  callback = function()
    if vim.lsp.buf.format then
      vim.lsp.buf.format({ async = false })
    end
  end
})
