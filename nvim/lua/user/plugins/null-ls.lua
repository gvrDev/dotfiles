local plugin = {
  setup = function()
    local null_ls = require("null-ls")
    local b = null_ls.builtins

    local sources = {

      b.formatting.prettierd.with({ filetypes = { "html", "yaml", "markdown", "typescript", "javascript", "svelte" } }),
      require("typescript.extensions.null-ls.code-actions"),

      b.formatting.stylua,

      b.formatting.rustfmt,

      b.formatting.shfmt,
    }

    local lsp_formatting = function(bufnr)
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        bufnr = bufnr,
      })
    end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            lsp_formatting(bufnr)
          end,
        })
      end
    end

    null_ls.setup({
      debug = true,
      sources = sources,
      on_attach = on_attach,
    })
  end
}

return plugin
