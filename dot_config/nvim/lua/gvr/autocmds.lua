vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

local function treesitter_try_attach(buf, language)
  if not vim.treesitter.language.add(language) then return end
  vim.treesitter.start(buf, language)
  vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  vim.wo.foldmethod = 'expr'
  vim.wo.foldlevel = 99
  local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil
  if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
end
local available_parsers = require('nvim-treesitter').get_available()
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf, filetype = args.buf, args.match
    local language = vim.treesitter.language.get_lang(filetype)
    if not language then return end

    local installed_parsers = require('nvim-treesitter').get_installed 'parsers'
    if vim.tbl_contains(installed_parsers, language) then
      treesitter_try_attach(buf, language)
    elseif vim.tbl_contains(available_parsers, language) then
      require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
    else
      treesitter_try_attach(buf, language)
    end
  end,
})

local group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(event)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buf = event.buf })
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { buf = event.buf })
    vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { buf = event.buf })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buf = event.buf })
  end,
})

local group = vim.api.nvim_create_augroup('close_with_q', { clear = true })
local function map_q(buf, close_fn)
  vim.bo[buf].buflisted = false
  vim.keymap.set('n', 'q', close_fn, {
    buffer = buf,
    silent = true,
    nowait = true,
    desc = 'Quit buffer',
  })
end

vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = {
    'fugitive',
    'diff',
  },
  callback = function(event)
    map_q(event.buf, function()
      pcall(vim.cmd, 'close')
      pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
    end)
  end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = group,
  pattern = {
    'fugitive://*',
    'octo://*',
    'nvim-pack://*',
  },
  callback = function(event)
    map_q(event.buf, function()
      pcall(vim.cmd, 'close')
      pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
    end)
  end,
})
