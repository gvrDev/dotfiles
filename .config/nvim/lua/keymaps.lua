vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

vim.keymap.set('n', 'U', vim.cmd.redo)

vim.keymap.set('n', '<leader>|', '<CMD>vsplit<CR><C-w><C-l>', { desc = 'Vertical Split ' })
vim.keymap.set('n', '<leader>-', '<CMD>split<CR><C-w><C-j>', { desc = 'Horizontal Split ' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', 'g_')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'N', 'nzzzv')
vim.keymap.set('n', 'n', 'Nzzzv')

vim.keymap.set('v', '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>y', [["+y$]])
vim.keymap.set('v', '<leader>d', [["_d]])
vim.keymap.set('n', 'x', [["_x]])
vim.keymap.set('n', '<leader>p', [["_dP]])

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set({ 'i', 's' }, '<Tab>', function()
    if vim.snippet.active { direction = 1 } then
        return '<cmd>lua vim.snippet.jump(1)<cr>'
    else
        return '<Tab>'
    end
end, { expr = true })
vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
    if vim.snippet.active { direction = -1 } then
        return '<cmd>lua vim.snippet.jump(-1)<cr>'
    else
        return '<S-Tab>'
    end
end, { expr = true })
