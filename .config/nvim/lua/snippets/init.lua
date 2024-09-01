local M = {}

local global_snippets = {
	{ trigger = "bash", body = "#!/bin/bash" },
}

local snippets_by_filetype = {
	xml = {
		{ trigger = "tar", body = "<target>${1:target}</target>" },
	},
	hurl = {
		{
			trigger = "bearer",
			body = [[
POST {{host}}/auth/login
[FormParams]
email: ${1:email}
password: ${2:password}
HTTP 200
[Captures]
bearer_token: jsonpath "${3:jsonPath}.accessToken"]],
		},
	},
}

local function get_buf_snips()
	local ft = vim.bo.filetype
	local snips = vim.list_slice(global_snippets)

	if ft and snippets_by_filetype[ft] then
		vim.list_extend(snips, snippets_by_filetype[ft])
	end

	return snips
end

function M.register_cmp_source()
	local cmp_source = {}
	local cache = {}
	function cmp_source.complete(_, _, callback)
		local bufnr = vim.api.nvim_get_current_buf()
		if not cache[bufnr] then
			local completion_items = vim.tbl_map(function(s)
				---@type lsp.CompletionItem
				local item = {
					word = s.trigger,
					label = s.trigger,
					kind = vim.lsp.protocol.CompletionItemKind.Snippet,
					insertText = s.body,
					insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet,
				}
				return item
			end, get_buf_snips())

			cache[bufnr] = completion_items
		end

		callback(cache[bufnr])
	end

	require("cmp").register_source("snp", cmp_source)
end

return M
