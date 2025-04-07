return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        indent = { enabled = true },
        quickfile = { enabled = true },
        bufdelete = { enabled = true },
        statuscolumn = { enabled = true },
    },
    keys = {
        { '<leader>bd', '<cmd>lua Snacks.bufdelete.delete()<cr>', desc = 'delete current buffer' },
    },
}
