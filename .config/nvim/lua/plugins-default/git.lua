return {
    {
        'tpope/vim-fugitive',
        command = 'Git',
        keys = {
            { '<leader>gs', '<cmd>Git<cr>', desc = 'Git' },
            { '<leader>gp', '<cmd>Git pull --rebase<cr>', desc = 'Git pull' },
            { '<leader>gP', '<cmd>Git push<cr>', desc = 'Git push' },
            { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git commit' },
            { '<leader>gt', ':Git push -u origin ', desc = 'Git push set origin' },
        },
    },
    {
        'lewis6991/gitsigns.nvim',
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
        command = 'Octo',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        keys = {
            { '<leader>o', '<cmd>Octo<cr>', desc = 'Octo' },
        },
        config = function()
            require('octo').setup { enable_builtin = true }
            vim.cmd [[hi OctoEditable guibg=none]]
        end,
    },
}
