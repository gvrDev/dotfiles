return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = 'BufRead',
        opts_extend = {
            'ensure_installed',
        },
        opts = {
            ensure_installed = {
                'bash',
                'c',
                'diff',
                'html',
                'jsdoc',
                'json',
                'jsonc',
                'lua',
                'luadoc',
                'luap',
                'markdown',
                'markdown_inline',
                'printf',
                'query',
                'regex',
                'toml',
                'vim',
                'vimdoc',
                'xml',
                'yaml',
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'ruby' },
            },
            indent = { enable = true, disable = { 'ruby' } },
        },
        config = function(_, opts)
            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
}
