return {
    {
        'christoomey/vim-tmux-navigator',
        cmd = {
            'TmuxNavigateLeft',
            'TmuxNavigateDown',
            'TmuxNavigateUp',
            'TmuxNavigateRight',
            'TmuxNavigatePrevious',
        },
        keys = {
            { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
            { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
            { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
            { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
            { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
        },
    },
    {
        'mistricky/codesnap.nvim',
        build = 'make',
        cmd = { 'CodeSnap', 'CodeSnapASCII' },
        opts = { has_breadcrumbs = true, has_line_number = true },
    },
    { 'tpope/vim-sleuth' },
    { 'ThePrimeagen/vim-be-good' },
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
    {
        'sphamba/smear-cursor.nvim',
        opts = {
            stiffness = 0.8,
            trailing_stiffness = 0.5,
            distance_stop_animating = 0.5,
            hide_target_hack = false,
        },
    },
}
