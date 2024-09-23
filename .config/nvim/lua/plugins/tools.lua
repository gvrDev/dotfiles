return {
    {
        'stevearc/oil.nvim',
        lazy = false,
        opts = {
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            columns = { 'icon' },
            view_options = {
                show_hidden = true,
                natural_order = true,
                is_always_hidden = function(name, _)
                    return name == '..' or name == '.git'
                end,
            },
        },
        keys = {
            {
                '<leader>.',
                vim.cmd.Oil,
                mode = 'n',
                desc = 'Open Oil file manager',
            },
        },
    },
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
                    require('harpoon'):list():append()
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
        'folke/trouble.nvim',
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = 'Trouble',
        keys = {
            {
                '<leader>xx',
                '<cmd>Trouble diagnostics toggle<cr>',
                desc = 'Diagnostics (Trouble)',
            },
            {
                '<leader>xX',
                '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
                desc = 'Buffer Diagnostics (Trouble)',
            },
            {
                '<leader>cs',
                '<cmd>Trouble symbols toggle focus=false<cr>',
                desc = 'Symbols (Trouble)',
            },
            {
                '<leader>cl',
                '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
                desc = 'LSP Definitions / references / ... (Trouble)',
            },
            {
                '<leader>xL',
                '<cmd>Trouble loclist toggle<cr>',
                desc = 'Location List (Trouble)',
            },
            {
                '<leader>xQ',
                '<cmd>Trouble qflist toggle<cr>',
                desc = 'Quickfix List (Trouble)',
            },
        },
    },
    {
        'kndndrj/nvim-dbee',
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        build = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require('dbee').install()
        end,
        config = function()
            require('dbee').setup(--[[optional config]])
        end,
        cmd = { 'Dbee' },
    },
    {
        'stevearc/overseer.nvim',
        opts = {},
    },
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },
}
