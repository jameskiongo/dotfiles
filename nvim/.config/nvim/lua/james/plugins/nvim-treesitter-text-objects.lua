return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
				include_surrounding_whitespace = false,
			},
		})

		-- select textobjects
		local select = require("nvim-treesitter-textobjects.select")
		local select_map = {
			["a="] = "@assignment.outer",
			["i="] = "@assignment.inner",
			["l="] = "@assignment.lhs",
			["r="] = "@assignment.rhs",

			["a:"] = "@property.outer",
			["i:"] = "@property.inner",
			["l:"] = "@property.lhs",
			["r:"] = "@property.rhs",

			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",

			["ai"] = "@conditional.outer",
			["ii"] = "@conditional.inner",

			["al"] = "@loop.outer",
			["il"] = "@loop.inner",

			["af"] = "@call.outer",
			["if"] = "@call.inner",

			["am"] = "@function.outer",
			["im"] = "@function.inner",

			["ac"] = "@class.outer",
			["ic"] = "@class.inner",
		}
		for key, query in pairs(select_map) do
			vim.keymap.set({ "x", "o" }, key, function()
				select.select_textobject(query, "textobjects")
			end, { desc = "Select " .. query })
		end

		--swap
		local swap = require("nvim-treesitter-textobjects.swap")
		vim.keymap.set("n", "<leader>na", function()
			swap.swap_next("@parameter.inner")
		end, { desc = "Swap parameter/argument with next" })
		vim.keymap.set("n", "<leader>n:", function()
			swap.swap_next("@property.outer")
		end, { desc = "Swap object property with next" })
		vim.keymap.set("n", "<leader>nm", function()
			swap.swap_next("@function.outer")
		end, { desc = "Swap function with next" })

		vim.keymap.set("n", "<leader>pa", function()
			swap.swap_previous("@parameter.inner")
		end, { desc = "Swap parameter/argument with previous" })
		vim.keymap.set("n", "<leader>p:", function()
			swap.swap_previous("@property.outer")
		end, { desc = "Swap object property with previous" })
		vim.keymap.set("n", "<leader>pm", function()
			swap.swap_previous("@function.outer")
		end, { desc = "Swap function with previous" })

		local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

		vim.keymap.set("i", "jl", "<ESC>o", { desc = "Insert newline below" }) -- insert newline below
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

		-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
	end,
}
