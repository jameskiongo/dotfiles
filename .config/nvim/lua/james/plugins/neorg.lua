return {
	"nvim-neorg/neorg",
	dependencies = {
		"nvim-treesitter",
	},
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Load all the default modules
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/Documents/notes",
							projects = "~/Documents/projects",
						},
						default_workspace = "notes",
					},
				},

				["core.keybinds"] = {
					config = {
						default_keybinds = false,
						vim.keymap.set("n", "<leader>on", "<Plug>(neorg.dirman.new-note)", {}),
						vim.keymap.set("n", "<leader>ot", "<Plug>(neorg.pivot.list.toggle)", {}),
					},
				},
				["core.concealer"] = {
					config = {
						-- Configure the icons for the concealer module
						icon_preset = "diamond",
					},
				},
			},
		})
	end,
}
