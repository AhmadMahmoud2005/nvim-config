return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					default = "",
				},
			},
			sources = { "filesystem", "buffers", "git_status" },
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {})
		vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus on Neo-tree" })
	end,
}
