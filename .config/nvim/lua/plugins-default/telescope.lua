return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        event = 'VimEnter',
        dependencies = {
            'nvim-lua/plenary.nvim',
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
            telescope.load_extension 'git_worktree'

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
