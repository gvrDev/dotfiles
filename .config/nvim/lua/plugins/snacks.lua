return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            indent = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            terminal = { enabled = false },
        },
        keys = {
            {
                '<leader>bd',
                function()
                    Snacks.bufdelete()
                end,
                desc = 'Delete Buffer',
            },
            {
                '<leader>cR',
                function()
                    Snacks.rename.rename_file()
                end,
                desc = 'Rename File',
            },
            {
                '<leader>gB',
                function()
                    Snacks.gitbrowse()
                end,
                desc = 'Git Browse',
            },
            {
                '<leader>gb',
                function()
                    Snacks.git.blame_line()
                end,
                desc = 'Git Blame Line',
            },
            {
                ']]',
                function()
                    Snacks.words.jump(vim.v.count1)
                end,
                desc = 'Next Reference',
                mode = { 'n', 't' },
            },
            {
                '[[',
                function()
                    Snacks.words.jump(-vim.v.count1)
                end,
                desc = 'Prev Reference',
                mode = { 'n', 't' },
            },
        },
    },
}
