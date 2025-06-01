return {
    {
        'saghen/blink.cmp',
        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                ['<CR>'] = { 'accept', 'fallback' },
                ['<C-\\>'] = { 'hide', 'fallback' },
                ['<C-n>'] = { 'select_next', 'show' },
                ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
                ['<C-p>'] = { 'select_prev' },
                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            },
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = 'mono',
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                menu = {
                    draw = {
                        treesitter = { 'lsp' },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
        opts_extend = { 'sources.default' },
    },
}
