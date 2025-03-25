return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', opts = {} },
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
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
                    map('<leader>lgd', builtin.lsp_definitions, '[G]oto [D]efinition')
                    map('<leader>lgi', builtin.lsp_implementations, '[G]oto [I]mplementation')
                    map('<c-a>', vim.lsp.buf.signature_help, 'signature_help', 'i')
                    map('<leader>lrn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map('<leader>lca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                    map('K', vim.lsp.buf.hover, 'Hover Documentation')

                    local function client_supports_method(client, method, bufnr)
                        if vim.fn.has 'nvim-0.11' == 1 then
                            return client:supports_method(method, bufnr)
                        else
                            return client.supports_method(method, { bufnr = bufnr })
                        end
                    end
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if
                        client
                        and client_supports_method(
                            client,
                            vim.lsp.protocol.Methods.textDocument_documentHighlight,
                            event.buf
                        )
                    then
                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                -- vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                            end,
                        })
                    end
                end,
            })
            vim.diagnostic.config {
                severity_sort = true,
                float = { 'rounded', source = 'if_many' },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = vim.g.have_nerd_font and {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '󰅚 ',
                        [vim.diagnostic.severity.WARN] = '󰀪 ',
                        [vim.diagnostic.severity.INFO] = '󰋽 ',
                        [vim.diagnostic.severity.HINT] = '󰌶 ',
                    },
                } or {},
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
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
        end,
    },
    {
        'stevearc/conform.nvim',
        opts = {
            notify_on_error = false,
            format_on_save = {
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { 'biome' },
                typescript = { 'biome' },
                jsx = { 'biome' },
                javascriptreact = { 'biome' },
                tsx = { 'biome' },
                typescriptreact = { 'biome' },
                json = { 'biome' },
                jsonc = { 'biome' },
                css = { 'biome' },
                html = { 'prettierd', 'prettier', stop_after_first = true },
                less = { 'prettierd', 'prettier', stop_after_first = true },
                scss = { 'prettierd', 'prettier', stop_after_first = true },
                yaml = { 'prettierd', 'prettier', stop_after_first = true },
            },
        },
    },
}
