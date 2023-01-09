-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/gui/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/gui/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/gui/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/gui/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/gui/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "require('user.plugins.config.comment')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  everforest = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('user.plugins.config.gitsigns')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-baby"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  harpoon = {
    config = { "require('user.plugins.config.harpoon')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('user.plugins.config.indent-blankline')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-zero.nvim"] = {
    config = { "require('user.plugins.config.lsp')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('user.plugins.config.lualine')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "require('user.plugins.config.null-ls')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('user.plugins.config.autopairs')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('user.plugins.config.colorizer')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "require('user.plugins.config.nvim-tree')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('user.plugins.config.treesitter')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-angular"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/nvim-treesitter-angular",
    url = "https://github.com/elgiano/nvim-treesitter-angular"
  },
  ["nvim-ts-autotag"] = {
    config = { "require('user.plugins.config.autotag')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "require('user.plugins.config.rust-tools')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('user.plugins.config.telescope')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["typescript.nvim"] = {
    config = { "require('user.plugins.config.typescript')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  undotree = {
    config = { "require('user.plugins.config.undotree')" },
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/gui/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require('user.plugins.config.comment')
time([[Config for Comment.nvim]], false)
-- Config for: typescript.nvim
time([[Config for typescript.nvim]], true)
require('user.plugins.config.typescript')
time([[Config for typescript.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require('user.plugins.config.null-ls')
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('user.plugins.config.autopairs')
time([[Config for nvim-autopairs]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('user.plugins.config.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('user.plugins.config.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('user.plugins.config.telescope')
time([[Config for telescope.nvim]], false)
-- Config for: lsp-zero.nvim
time([[Config for lsp-zero.nvim]], true)
require('user.plugins.config.lsp')
time([[Config for lsp-zero.nvim]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
require('user.plugins.config.rust-tools')
time([[Config for rust-tools.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
require('user.plugins.config.harpoon')
time([[Config for harpoon]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require('user.plugins.config.colorizer')
time([[Config for nvim-colorizer.lua]], false)
-- Config for: undotree
time([[Config for undotree]], true)
require('user.plugins.config.undotree')
time([[Config for undotree]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
require('user.plugins.config.autotag')
time([[Config for nvim-ts-autotag]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('user.plugins.config.indent-blankline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('user.plugins.config.nvim-tree')
time([[Config for nvim-tree.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('user.plugins.config.gitsigns')
time([[Config for gitsigns.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
