local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local b = null_ls.builtins

local sources = {
	-- format html and markdown
	b.formatting.dprint.with({ filetypes = { "html", "yaml", "markdown", "typescript", "javascript", "svelte" } }),
	-- markdown diagnostic
	b.diagnostics.markdownlint,
	-- Lua formatting
	b.formatting.stylua,

	b.formatting.rustfmt,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = on_attach,
})
