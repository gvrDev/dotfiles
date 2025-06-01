return {
    {
        'mbbill/undotree',
        dependencies = 'nvim-lua/plenary.nvim',
        keys = {
            {
                '<leader>tu',
                vim.cmd.UndotreeToggle,
                desc = 'Open undo tree',
                mode = 'n',
            },
        },
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('harpoon'):setup {}
        end,
        keys = {
            {
                '<leader>ha',
                function()
                    require('harpoon'):list():add()
                end,
                desc = 'Add buffer to harpoon',
                mode = 'n',
            },
            {
                '<leader>th',
                function()
                    require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
                end,
                desc = 'Harpoon buffer list',
                mode = 'n',
            },
            {
                '<leader>1',
                function()
                    require('harpoon'):list():select(1)
                end,
                desc = 'Go to first buffer in harpoon',
                mode = 'n',
            },
            {
                '<leader>2',
                function()
                    require('harpoon'):list():select(2)
                end,
                desc = 'Go to second buffer in harpoon',
                mode = 'n',
            },
            {
                '<leader>3',
                function()
                    require('harpoon'):list():select(3)
                end,
                mode = 'n',
                desc = 'Go to third buffer in harpoon',
            },
            {
                '<leader>4',
                function()
                    require('harpoon'):list():select(4)
                end,
                desc = 'Go to fourth buffer in harpoon',
                mode = 'n',
            },
        },
    },
    {
        'ThePrimeagen/refactoring.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        keys = {
            {
                '<leader>r',
                function()
                    require('refactoring').select_refactor()
                end,
                mode = 'v',
                noremap = true,
                silent = true,
                expr = false,
            },
        },
    },
    {
        'MagicDuck/grug-far.nvim',
        -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
        -- additional lazy config to defer loading is not really needed...
        config = function()
            -- optional setup call to override plugin options
            -- alternatively you can set options with vim.g.grug_far = { ... }
            require('grug-far').setup {
                -- options, see Configuration section below
                -- there are no required options atm
            }
        end,
    },
}
