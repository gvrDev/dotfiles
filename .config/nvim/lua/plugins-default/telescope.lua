return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            {
                'ThePrimeagen/git-worktree.nvim',
                opts = {},
            },
        },
        config = function()
            local telescope = require 'telescope'
            telescope.setup {
                extensions = {
                    git_worktree = {},
                },
            }

            -- Enable Telescope extensions if they are installed
            telescope.load_extension 'fzf'
            telescope.load_extension 'git_worktree'

            -- See `:help telescope.builtin`
            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

            -- git
            vim.keymap.set(
                'n',
                '<leader>gwl',
                telescope.extensions.git_worktree.git_worktrees,
                { desc = '[G]it [W]orktrees [L]ist' }
            )
            vim.keymap.set(
                'n',
                '<leader>gwn',
                telescope.extensions.git_worktree.create_git_worktree,
                { desc = '[G]it [W]orktrees [N]ew' }
            )
        end,
    },
}
