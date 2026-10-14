return {
	"gbprod/yanky.nvim",
	opts = {
		ring = {
			history_length = 100,
			storage = "shada", -- or "shada" if you don't want sqlite.lua
			sync_with_numbered_registers = true,
			cancel_event = "update",
		},
		system_clipboard = {
			sync_with_ring = true,
		},
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 200,
		},
		preserve_cursor_position = {
			enabled = true,
		},
		keys = {
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" } },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
			{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
			{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },

			{ "<c-p>", "<Plug>(YankyPreviousEntry)", mode = "n" },
			{ "<c-n>", "<Plug>(YankyNextEntry)", mode = "n" },
		},
	},
	config = function(_, opts)
		require("yanky").setup(opts)
		vim.api.nvim_set_hl(0, "YankyPut", { fg = "#352f2d", bg = "#868c91" })
		vim.api.nvim_set_hl(0, "YankyYanked", { fg = "#352f2d", bg = "#868c91" })
	end,
}
