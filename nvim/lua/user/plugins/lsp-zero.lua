local plugin = {
	setup = function()
		local lsp = require("lsp-zero")

		lsp.preset({
			name = "recommended",
			set_lsp_keymaps = false,
			suggest_lsp_servers = false,
			sign_icons = false,
			manage_nvim_cmp = true,
		})

		lsp.ensure_installed({
			"tsserver",
			"angularls",
			"eslint",
			"emmet_ls",
			"rust_analyzer",
			"lua_ls",
		})

		lsp.skip_server_setup({ "tsserver" })

		-- local cmp = require("cmp")
		-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
		-- local cmp_mappings = lsp.defaults.cmp_mappings({
		-- 	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		-- 	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		-- 	["<C-y>"] = cmp.mapping.confirm({ select = true }),
		-- 	["<C-Space>"] = cmp.mapping.complete(),
		-- })

		lsp.nvim_workspace()

		lsp.setup()
	end,
}
return plugin
