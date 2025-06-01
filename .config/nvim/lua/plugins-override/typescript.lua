return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = function(_, opts)
            if type(opts.ensure_installed) == 'table' then
                vim.list_extend(opts.ensure_installed, {
                    'angular',
                    'scss',
                    'typescript',
                    'tsx',
                    'javascript',
                })
            end
            vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
                pattern = { '*.component.html', '*.container.html' },
                callback = function()
                    vim.treesitter.start(nil, 'angular')
                end,
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        opts = function(_, opts)
            opts.servers.angularls = {
                server_capabilities = {
                    renameProvider = false,
                    documentFormattingProvider = false,
                },
            }
            opts.servers.cssls = {}
            opts.servers.tailwindcss = {}
            opts.servers.emmet_ls = {}
            opts.servers.html = {}
            opts.servers.vtsls = {
                settings = {
                    tsserver = {
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
            }
        end,
    },
    {
        'mfussenegger/nvim-dap',
        opts = function(_, opts)
            local dap = require 'dap'
            local vscode = require 'dap.ext.vscode'
            local js_filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'tsx', 'jsx' }

            dap.adapters['pwa-node'] = {
                type = 'server',
                host = 'localhost',
                port = '${port}',
                executable = {
                    command = 'node',
                    -- 💀 Make sure to update this path to point to your installation
                    args = {
                        vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js',
                        '${port}',
                    },
                },
            }
            vscode.type_to_filetypes['node'] = js_filetypes
            vscode.type_to_filetypes['pwa-node'] = js_filetypes

            for _, language in ipairs(js_filetypes) do
                if not dap.configurations[language] then
                    dap.configurations[language] = {
                        {
                            type = 'pwa-node',
                            request = 'launch',
                            name = 'Launch file',
                            program = '${file}',
                            cwd = '${workspaceFolder}',
                        },
                        {
                            type = 'pwa-node',
                            request = 'attach',
                            name = 'Attach',
                            processId = require('dap.utils').pick_process,
                            cwd = '${workspaceFolder}',
                        },
                    }
                end
            end
        end,
    },
}
