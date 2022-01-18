--require'compe'.setup ({
  --enabled = true,
  --debug = false,
  --preselect = 'disable',
  --autocomplete = true,
  --throttle_time = 80,
  --source_timeout = 200,
  --incomplete_delay = 400,
  --allow_prefix_unmatch = false,

  --source = {
    --path = {menu = '[PATH]', priority = 9},
    --buffer = {menu = '[BUF]', priority = 8},
    --calc = true,
    --vsnip = {menu = '[VSNP]', priority = 7},
    --nvim_lsp = {menu = '[LSP]', priority = 10, sort = false},
    --nvim_lua = {menu = '[LUA]', priority = 6},
    --luasnip = {menu = '[SNP]', priority = 10},
    --spell = false,
    --tags = true,
    --snippets_nvim = false,
  --},
--})

--local t = function(str)
  --return vim.api.nvim_replace_termcodes(str, true, true, true)
--end

--local check_back_space = function()
  --local col = vim.fn.col('.') - 1
  --if col == 0 or vim.fn.getline('.').sub(col, col):match('%s') then
    --return true
  --else
    --return false
  --end
--end

--local function prequire(...)
  --local status, lib = pcall(require, ...)
  --if (status) then return lib end
  --return nil
--end

--local luasnip = prequire 'luasnip'
--_G.tab_complete = function()
  --if vim.fn.pumvisible() == 1 then
    --return t '<C-n>'
  --elseif luasnip and luasnip.expand_or_jumpable() then
      --return t '<Plug>luasnip-expand-or-jump'
  --elseif check_back_space() then
    --return t '<Tab>'
  --else
    --return vim.fn['compe#complete']()
  --end
--end

--_G.s_tab_complete = function()
  --if vim.fn.pumvisible() == 1 then
    --return t '<C-p>'
  --elseif luasnip and luasnip.expand_or_jumpable(-1) then
    --return t '<Plug>luasnip-jump-prev'
  --else
    --return t '<S-Tab>'
  --end
--end

--vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
