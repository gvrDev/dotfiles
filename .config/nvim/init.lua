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
        { import = 'plugins-default' },
        { import = 'plugins-override' },
    },
    install = {
        missing = false,
    },
    change_detection = {
        notify = false,
    },
    rocks = {
        enabled = false,
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
vim.cmd.colorscheme 'catppuccin-mocha'
