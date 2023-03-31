return {
	"ThePrimeagen/harpoon",
	keys = {
		{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file to harpoon" },
		{ "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Open harpoon quickmenu" },
		{ "<C-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Open first harpoon instance" },
		{ "<C-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Open second harpoon instance" },
		{ "<C-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Open third harpoon instance" },
		{ "<C-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Open fourth harpoon instance" },
	},
}
