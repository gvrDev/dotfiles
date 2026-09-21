local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    vim.print(name)

    if name == 'fff.nvim' then
      if not ev.data.active then vim.cmd.packadd 'fff.nvim' end
      require('fff.download').download_or_build_binary()
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})

-- UTILS --
local function gh(repo) return 'https://github.com/' .. repo end

-- Plugins list --
vim.cmd 'packadd nvim.undotree'
vim.pack.add {
  gh 'NMAC427/guess-indent.nvim',
  gh 'lewis6991/gitsigns.nvim',
  gh 'dmtrKovalenko/fff.nvim',
  gh 'stevearc/conform.nvim',
  { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' },
  gh 'mason-org/mason.nvim',
  gh 'folke/tokyonight.nvim',
  gh 'nvim-mini/mini.pairs',
  gh 'nvim-mini/mini.icons',
  gh 'j-hui/fidget.nvim',
  { src = gh 'nvim-treesitter/nvim-treesitter', version = 'main' },
  gh 'neovim/nvim-lspconfig',
  gh 'stevearc/oil.nvim',
}

-- Setup --
require('guess-indent').setup {}
require('tokyonight').setup {
  styles = {
    comments = { italic = false },
  },
}
vim.cmd.colorscheme 'tokyonight-night'
require('conform').setup {
  notify_on_error = false,
  formatters_by_ft = {
    lua = { 'stylua' },

    javascript = { 'biome' },
    javascriptreact = { 'biome' },
    typescript = { 'biome' },
    typescriptreact = { 'biome' },
    json = { 'biome' },
    jsonc = { 'biome' },
    css = { 'biome' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}
require('blink.cmp').setup {
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono',
  },
  sources = {
    default = { 'lsp', 'path', 'snippets' },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true },
}
require('mason').setup()
local ensure_installed = {
  'angular-language-server',
  'biome',
  'css-lsp',
  'html-lsp',
  'json-lsp',
  'lua-language-server',
  'ols',
  'taplo',
  'vtsls',
  'yaml-language-server',

  'stylua',
  'tsc',
}
local registry = require 'mason-registry'
registry.refresh(function()
  for _, name in ipairs(ensure_installed) do
    local ok, package = pcall(registry.get_package, name)
    if not ok then
      vim.notify(('Unknown Mason package: %s'):format(name), vim.log.levels.ERROR)
    elseif not package:is_installed() then
      package:install()
    end
  end
end)
require('mini.pairs').setup()
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
require('fidget').setup()
require('gitsigns').setup {
  signs = {
    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
  },
}
require('oil').setup {
  keymaps = {
    ['<C-h>'] = false,
    ['q'] = 'actions.close',
    ['l'] = 'actions.select',
    ['h'] = 'actions.parent',
    ['.'] = 'actions.toggle_hidden',
  },
}
