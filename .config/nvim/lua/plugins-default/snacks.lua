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
        picker = { enabled = true },
    },
    keys = {
        { '<leader>bd', '<cmd>lua Snacks.bufdelete.delete()<cr>', desc = 'delete current buffer' },
        { '<leader>sf', '<cmd>lua Snacks.picker.files()<cr>', desc = 'Show git log' },
        { '<leader>sg', '<cmd>lua Snacks.picker.grep()<cr>', desc = 'Show git log' },
        { '<leader><leader>', '<cmd>lua Snacks.picker.buffers()<cr>', desc = 'Show git log' },
        { '<leader>glp', '<cmd>lua Snacks.picker.git_log()<cr>', desc = 'Show git log' },
        { '<leader>glf', '<cmd>lua Snacks.picker.git_log_file()<cr>', desc = 'Show git log for current file' },
        { '<leader>gll', '<cmd>lua Snacks.picker.git_log_line()<cr>', desc = 'Show git log for current line' },
        { '<leader>gb', '<cmd>lua Snacks.picker.git_branches()<cr>', desc = 'Show git branches' },
    },
}
