return {
    { 'catppuccin/nvim', name = 'catppuccin', config = true, lazy = true },
    { 'scottmckendry/cyberdream.nvim', lazy = true },
    { 'EdenEast/nightfox.nvim', lazy = true },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = true,
        opts = {
            highlight_groups = {
                TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
                TelescopeNormal = { bg = 'none' },
                TelescopePromptNormal = { bg = 'base' },
                TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
                TelescopeSelection = { fg = 'text', bg = 'base' },
                TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
            },
        },
    },
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        lazy = false,
        opts = {},
    },
    {
        'nyoom-engineering/oxocarbon.nvim',
        priority = 1000,
        lazy = true,
    },
    {
        '0xstepit/flow.nvim',
        lazy = true,
        priority = 1000,
        config = function()
            require('flow').setup {
                dark_theme = true,
                transparent = false,
                high_contrast = false,
                fluo_color = 'pink',
                mode = 'desaturate',
                aggressive_spell = false,
            }
        end,
    },
    {
        'jesseleite/nvim-noirbuddy',
        dependencies = {
            { 'tjdevries/colorbuddy.nvim' },
        },
        lazy = false,
        priority = 1000,
        opts = {
            -- All of your `setup(opts)` will go here
        },
    },
}
