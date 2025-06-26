vim.lsp.enable {
    'lua_ls',
    'html',
    'taplo',
    'jsonls',
    'cssls',
    'tailwindcss',
    'angularls',
    'emmet_ls',
    'eslint',
    'vtsls',
}
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(_)
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = true, desc = 'LSP: ' .. desc })
        end

        local builtin = require 'telescope.builtin'
        map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('<c-h>', vim.lsp.buf.signature_help, 'signature_help', 'i')
        map('<leader>lrn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>lca', vim.lsp.buf.code_action, '[C]ode [A]ction')
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
