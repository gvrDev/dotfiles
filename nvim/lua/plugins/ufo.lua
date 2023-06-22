return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		require("ufo").setup({ close_fold_kinds = { "imports", "comment" } })
	end,
	init = function()
		function ClearFoldHighlightColors()
			vim.api.nvim_set_hl(0, "Folded", { ctermbg = 0, bg = 0 })
			vim.api.nvim_set_hl(0, "UfoFoldedBg", { ctermbg = 0, bg = 0 })
		end

		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
	end,
}
