require 'formatter'.setup {
  logging = false,
  filetype = {
    javascript = {
      require 'formatter.defaults.prettierd'
    },
    typescript = {
      require 'formatter.defaults.prettierd'
    }
  }
}

local format_group = vim.api.nvim_create_augroup('Formatter', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { "*.js", "*.ts", "*.tsx", "*.jsx", "*.json", "*.css", "*.scss", "*.html",
    "*.svelte", "*.astro" },
  group = format_group,
  callback = function()
    vim.cmd('FormatWriteLock')
  end
})
