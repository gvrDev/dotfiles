return {
    {
        'echasnovski/mini.nvim',
        version = false,
        lazy = false,
        keys = {
            {
                '<leader>.',
                function()
                    require('mini.files').open(vim.api.nvim_buf_get_name(0), false)
                end,
                mode = 'n',
                desc = 'Open mini files',
            },
        },
        config = function()
            require('mini.ai').setup()
            require('mini.surround').setup {
                mappings = {
                    add = 'ma',
                    delete = 'md',
                    find = 'mf',
                    find_left = 'mF',
                    highlight = 'mh',
                    replace = 'mr',
                    update_n_lines = 'mn',

                    suffix_last = 'l',
                    suffix_next = 'n',
                },
            }
            require('mini.files').setup {
                options = {
                    use_as_default_explorer = false,
                },
                mappings = {
                    close = '<Esc>',
                },
            }
            require('mini.icons').setup()
            require('mini.statusline').setup()
        end,
    },
}
