vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

local group = vim.api.nvim_create_augroup("close_with_q", { clear = true })

local function map_q(buf, close_fn)
	vim.bo[buf].buflisted = false
	vim.keymap.set("n", "q", close_fn, {
		buffer = buf,
		silent = true,
		nowait = true,
		desc = "Quit buffer",
	})
end

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = {
		"fugitive",
		"diff",
	},
	callback = function(event)
		map_q(event.buf, function()
			pcall(vim.cmd, "close")
			pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
		end)
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = group,
	pattern = {
		"fugitive://*",
		"octo://*",
		"nvim-pack://*",
	},
	callback = function(event)
		map_q(event.buf, function()
			pcall(vim.cmd, "close")
			pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
		end)
	end,
})
