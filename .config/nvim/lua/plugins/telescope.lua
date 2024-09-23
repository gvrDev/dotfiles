return {
    { -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { -- If encountering errors, see telescope-fzf-native README for installation instructions
                'nvim-telescope/telescope-fzf-native.nvim',

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            {
                'aaronhallaert/advanced-git-search.nvim',
                dependencies = {
                    'sindrets/diffview.nvim',
                },
            },
            {
                'ThePrimeagen/git-worktree.nvim',
                opts = {},
            },

            -- Useful for getting pretty icons, but requires a Nerd Font.
            -- { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        config = function()
            local telescope = require 'telescope'
            -- Telescope is a fuzzy finder that comes with a lot of different things that
            -- it can fuzzy find! It's more than just a "file finder", it can search
            -- many different aspects of Neovim, your workspace, LSP, and more!
            --
            -- The easiest way to use Telescope, is to start by doing something like:
            --  :Telescope help_tags
            --
            -- After running this command, a window will open up and you're able to
            -- type in the prompt window. You'll see a list of `help_tags` options and
            -- a corresponding preview of the help.
            --
            -- Two important keymaps to use while in Telescope are:
            --  - Insert mode: <c-/>
            --  - Normal mode: ?
            --
            -- This opens a window that shows you all of the keymaps for the current
            -- Telescope picker. This is really useful to discover what Telescope can
            -- do as well as how to actually do it!

            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`
            telescope.setup {
                -- You can put your default mappings / updates / etc. in here
                --  All the info you're looking for is in `:help telescope.setup()`
                --
                -- defaults = {
                --   mappings = {
                --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                --   },
                -- },
                -- pickers = {}
                extensions = {
                    git_worktree = {},
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                    advanced_git_search = {
                        import = {
                            -- Add imports to the top of the file keeping the cursor in place
                            insert_at_top = true,
                        },
                        diff_plugin = 'diffview',
                        git_flags = {},
                        git_diff_flags = {},
                        show_builtin_git_pickers = true,
                        smart_open = {
                            preview = { hide_on_startup = true },
                            layout_config = {
                                width = 0.65,
                            },
                            mappings = {
                                i = {
                                    ['<esc>'] = require('telescope.actions').close,
                                },
                            },
                        },
                    },
                },
            }

            -- Enable Telescope extensions if they are installed
            telescope.load_extension 'fzf'
            telescope.load_extension 'ui-select'
            telescope.load_extension 'advanced_git_search'
            telescope.load_extension 'git_worktree'

            -- See `:help telescope.builtin`
            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
            vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

            -- Slightly advanced example of overriding default behavior and theme
            vim.keymap.set('n', '<leader>/', function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            -- It's also possible to pass additional configuration options.
            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            vim.keymap.set('n', '<leader>s/', function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                }
            end, { desc = '[S]earch [/] in Open Files' })

            -- Shortcut for searching your Neovim configuration files
            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = '[S]earch [N]eovim files' })

            -- git
            vim.keymap.set(
                'n',
                '<leader>gfl',
                '<cmd>AdvancedGitSearch search_log_content_file<CR>',
                { desc = '[G]it [F]ile [L]og' }
            )
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
