return {
    { 'tpope/vim-fugitive' },
    {
        'lewis6991/gitsigns.nvim',
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
            -- OR 'ibhagwan/fzf-lua',
            -- OR 'folke/snacks.nvim',
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
