return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', opts = {} },
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
        },
        opts = function()
            local options = {
                servers = {
                    clangd = {
                        cmd = { '/usr/bin/clangd' },
                    },
                    lua_ls = {},
                    taplo = {},
                    html = {},
                    omnisharp = {},
                },
            }
            return options
        end,
        config = function(_, opts)
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    local builtin = require 'telescope.builtin'
                    map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
                    map('K', vim.lsp.buf.hover, 'Hover Documentation')
                    map('<c-h>', vim.lsp.buf.signature_help, 'signature_help', 'i')
                    map('<leader>lrn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map('<leader>lca', vim.lsp.buf.code_action, '[C]ode [A]ction')

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if
                        client
                        and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
                    then
                        local highlight_augroup =
                            vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                            end,
                        })
                    end
                end,
            })
            vim.diagnostic.config {
                severity_sort = true,
                float = { 'rounded', source = 'if_many' },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '󰅚 ',
                        [vim.diagnostic.severity.WARN] = '󰀪 ',
                        [vim.diagnostic.severity.INFO] = '󰋽 ',
                        [vim.diagnostic.severity.HINT] = '󰌶 ',
                    },
                },
                virtual_text = {
                    source = 'if_many',
                    spacing = 2,
                    format = function(diagnostic)
                        local diagnostic_message = {
                            [vim.diagnostic.severity.ERROR] = diagnostic.message,
                            [vim.diagnostic.severity.WARN] = diagnostic.message,
                            [vim.diagnostic.severity.INFO] = diagnostic.message,
                            [vim.diagnostic.severity.HINT] = diagnostic.message,
                        }
                        return diagnostic_message[diagnostic.severity]
                    end,
                },
            }

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ensure_installed = vim.tbl_keys(opts.servers or {})
            vim.list_extend(ensure_installed, {
                'stylua',
            })

            require('mason-tool-installer').setup { ensure_installed = ensure_installed }

            require('mason-lspconfig').setup {
                handlers = {
                    function(server_name)
                        local server = opts.servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        server.capabilities = require('blink.cmp').get_lsp_capabilities(server.capabilities)
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
        end,
    },
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        keys = {
            {
                -- Customize or remove this keymap to your liking
                '<leader>f',
                function()
                    require('conform').format { async = true }
                end,
                mode = '',
                desc = 'Format buffer',
            },
        },
        opts = {
            notify_on_error = false,
            default_format_opts = {
                lsp_format = 'fallback',
            },
            format_on_save = {
                timeout_ms = 500,
            },
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
                typescript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
                jsx = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
                javascriptreact = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
                tsx = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
                typescriptreact = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
                json = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
                jsonc = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
                css = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
                less = { 'prettierd', 'prettier', stop_after_first = true },
                scss = { 'prettierd', 'prettier', stop_after_first = true },
                html = { 'prettierd', 'prettier', stop_after_first = true },
                htmlangular = { 'prettierd', 'prettier', stop_after_first = true },
                yaml = { 'prettierd', 'prettier', stop_after_first = true },
            },
        },
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
}
