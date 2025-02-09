return {
    {
        'catgoose/nvim-colorizer.lua',
        event = 'BufReadPre',
        opts = {
            user_default_options = {
                tailwind = true,
                css = true,
            },
            filetypes = {
                'javascriptreact',
                'typescriptreact',
                'css',
                'scss',
                'sass',
                'less',
                html = { mode = 'foreground', names = false },
            },
        },
    },
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            'MunifTanjim/nui.nvim',
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            'rcarriga/nvim-notify',
        },
    },
    {
        'sphamba/smear-cursor.nvim',
        opts = {
            stiffness = 0.8,
            trailing_stiffness = 0.5,
            distance_stop_animating = 0.5,
            hide_target_hack = false,
            cursor_color = '#d3cdc3',
            cterm_cursor_colors = { 240, 245, 250, 255 },
            cterm_bg = 235,
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },
}
