local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp = vim.opt.rtp ^ lazypath

require 'settings'
require 'keymaps'
require 'autocmds'
require 'server'

require('lazy').setup {
    spec = {
        -- import/override with your plugins
        { import = 'plugins-default' },
        { import = 'plugins-override' },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    checker = {
        enabled = false, -- check for plugin updates periodically
        notify = false, -- notify on update
    }, -- automatically check for plugin updates
    change_detection = {
        notify = false,
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                'gzip',
                'netrwPlugin',
                'rplugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
}

vim.opt.background = 'dark' -- set this to dark or light
vim.cmd.colorscheme 'rose-pine'
