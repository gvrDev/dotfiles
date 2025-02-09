return {
    {
        'saghen/blink.cmp',
        version = '*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'default' },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono',
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
            },
        },
        opts_extend = { 'sources.default' },
    },
}
