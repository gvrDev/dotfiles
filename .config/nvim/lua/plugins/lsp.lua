return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
        },
        config = function()
            local capabilities = nil
            local lspconfig = require 'lspconfig'
            local servers = {
                angularls = {
                    server_capabilities = {
                        renameProvider = false,
                        documentFormattingProvider = false,
                    },
                },
                biome = true,
                clangd = true,
                cssls = true,
                lua_ls = true,
                tailwindcss = true,
                ts_ls = false,
                emmet_ls = true,
                html = true,
                zls = true,
                omnisharp = true,
                vtsls = {
                    filetypes = {
                        'javascript',
                        'javascriptreact',
                        'javascript.jsx',
                        'typescript',
                        'typescriptreact',
                        'typescript.tsx',
                    },
                    settings = {
                        complete_function_calls = true,
                        vtsls = {
                            enableMoveToFileCodeAction = true,
                            autoUseWorkspaceTsdk = true,
                            experimental = {
                                maxInlayHintLength = 30,
                                completion = {
                                    enableServerSideFuzzyMatch = true,
                                },
                            },
                            tsserver = {
                                globalPlugins = {
                                    {
                                        name = '@angular/language-server',
                                        location = vim.fn.stdpath 'data'
                                            .. '/mason/packages/angular-language-server/node_modules/@angular/language-server',
                                        enableForWorkspaceTypeScriptVersions = false,
                                    },
                                },
                            },
                        },
                        typescript = {
                            updateImportsOnFileMove = { enabled = 'always' },
                            suggest = {
                                completeFunctionCalls = true,
                            },
                            inlayHints = {
                                enumMemberValues = { enabled = true },
                                functionLikeReturnTypes = { enabled = true },
                                parameterNames = { enabled = 'literals' },
                                parameterTypes = { enabled = true },
                                propertyDeclarationTypes = { enabled = true },
                                variableTypes = { enabled = false },
                            },
                        },
                    },
                },
            }

            local servers_to_install = vim.tbl_filter(function(key)
                local t = servers[key]
                if type(t) == 'table' then
                    return not t.manual_install
                else
                    return t
                end
            end, vim.tbl_keys(servers))

            require('mason').setup()
            local ensure_installed = {
                'stylua',
                'prettier',
                'prettierd',
            }

            vim.list_extend(ensure_installed, servers_to_install)
            require('mason-tool-installer').setup { ensure_installed = ensure_installed }

            -- if pcall(require, 'cmp_nvim_lsp') then
            --     capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- end
            require('mason-lspconfig').setup {
                handlers = {
                    function(server_name)
                        local config = servers[server_name]
                        if config == false then
                            return
                        end
                        if config == true then
                            config = {}
                        end
                        config = vim.tbl_deep_extend('force', {}, { capabilities = capabilities }, config)
                        lspconfig[server_name].setup(config)
                    end,
                },
            }

            local disable_semantic_tokens = {
                lua = true,
            }
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local map = function(keys, func, desc)
                        vim.keymap.set('n', keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
                    end

                    local bufnr = args.buf
                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id), 'must have valid client')

                    local settings = servers[client.name]
                    if type(settings) ~= 'table' then
                        settings = {}
                    end

                    local builtin = require 'telescope.builtin'

                    map('<leader>lgd', builtin.lsp_definitions, '[G]oto [D]efinition')
                    map('<leader>lgi', builtin.lsp_implementations, '[G]oto [I]mplementation')
                    vim.keymap.set('i', '<c-a>', vim.lsp.buf.signature_help)
                    map('<leader>lrn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map('<leader>lca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                    map('K', vim.lsp.buf.hover, 'Hover Documentation')

                    local filetype = vim.bo[bufnr].filetype
                    if disable_semantic_tokens[filetype] then
                        client.server_capabilities.semanticTokensProvider = nil
                    end

                    -- Override server capabilities
                    if settings.server_capabilities then
                        for k, v in pairs(settings.server_capabilities) do
                            if v == vim.NIL then
                                ---@diagnostic disable-next-line: cast-local-type
                                v = nil
                            end

                            client.server_capabilities[k] = v
                        end
                    end
                end,
            })
        end,
    },
    {
        'stevearc/conform.nvim',
        opts = {
            notify_on_error = false,
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { 'biome' },
                typescript = { 'biome' },
                jsx = { 'biome' },
                tsx = { 'biome' },
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
