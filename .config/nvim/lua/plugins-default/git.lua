return {
    {
        'tpope/vim-fugitive',
        cmd = { 'Git' },
        keys = {
            { '<leader>gg', '<cmd>Git<cr>', desc = 'Git' },
            { '<leader>gp', '<cmd>Git pull --rebase<cr>', desc = 'Git pull' },
            { '<leader>gP', '<cmd>Git push<cr>', desc = 'Git push' },
            { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git commit' },
            { '<leader>gd', '<cmd>Gvdiffsplit<cr>', desc = 'Git diff split view' },
            { '<leader>gt', ':Git push -u origin ', desc = 'Git push set origin' },
            { '<leader>gs', ':Git switch ', desc = 'Git switch' },
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        lazy = false,
        keys = {
            { ']g', '<cmd>Gitsigns nav_hunk next<cr>', desc = 'next git hunk' },
            { '[g', '<cmd>Gitsigns nav_hunk prev<cr>', desc = 'prev git hunk' },
            { '<leader>ga', '<cmd>Gitsigns stage_hunk<cr>', desc = 'stage hunk' },
        },
        opts = {
            signs = {
                add = { text = '▎' },
                change = { text = '▎' },
                delete = { text = '' },
                topdelete = { text = '' },
                changedelete = { text = '▎' },
                untracked = { text = '▎' },
            },
            signs_staged = {
                add = { text = '▎' },
                change = { text = '▎' },
                delete = { text = '' },
                topdelete = { text = '' },
                changedelete = { text = '▎' },
            },
        },
    },
    {
        'pwntester/octo.nvim',
        cmd = { 'Octo' },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        keys = {
            { '<leader>o', '<cmd>Octo<cr>', desc = 'Octo' },
        },
        opts = {
            enable_builtin = true,
        },
        init = function()
            vim.cmd [[hi OctoEditable guibg=none]]
        end,
    },
}
