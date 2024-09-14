return {
    { 'echasnovski/mini.icons', version = false, opts = {} },
    {
        'NvChad/nvim-colorizer.lua',
        opts = {
            user_default_options = {
                tailwind = true,
            },
            filetypes = {
                'scss',
                'sass',
                'less',
                'css',
                'javascript',
                'javascriptreact',
                'jsx',
                'typescript',
                'typescriptreact',
                'tsx',
                html = { mode = 'foreground' },
            },
        },
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
}
