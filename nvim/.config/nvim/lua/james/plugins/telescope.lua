return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				file_ignore_patterns = { "node_modules", ".git/", "target/" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			-- pickers = {
			-- 	find_files = {
			-- 		hidden = true,
			-- 		no_ignore = true,
			-- 	},
			-- },
			extensions = {
				undo = {
					opts = {
						extensions = {
							["ui-select"] = {
								require("telescope.themes").get_dropdown({
									-- even more opts
								}),
							},
							undo = {
								side_by_side = true,
								layout_strategy = "vertical",
								layout_config = {
									preview_height = 0.8,
								},
							},
							fzf = {},
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("undo")
		telescope.load_extension("yank_history")
		telescope.load_extension("ui-select")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>")
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "open telescope buffers" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "open telescope todo" })
		keymap.set("n", "<leader>fp", "<cmd>Telescope yank_history<cr>", { desc = "Open Yank History" })
		keymap.set("n", "<leader>fa", function()
			require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
		end, { desc = "Find all files (incl. hidden)" })
	end,
}
