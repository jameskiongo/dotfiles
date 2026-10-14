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
			move = {
				set_jumps = true,
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

			["am"] = "@call.outer",
			["im"] = "@call.inner",

			["af"] = "@function.outer",
			["if"] = "@function.inner",

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

		-- move textobjects
		local move = require("nvim-treesitter-textobjects.move")

		local function goto_next_start(query, query_group)
			return function()
				move.goto_next_start(query, query_group or "textobjects")
			end
		end
		local function goto_next_end(query, query_group)
			return function()
				move.goto_next_end(query, query_group or "textobjects")
			end
		end
		local function goto_prev_start(query, query_group)
			return function()
				move.goto_previous_start(query, query_group or "textobjects")
			end
		end
		local function goto_prev_end(query, query_group)
			return function()
				move.goto_previous_end(query, query_group or "textobjects")
			end
		end

		vim.keymap.set({ "n", "x", "o" }, "]f", goto_next_start("@call.outer"), { desc = "Next function call start" })
		vim.keymap.set(
			{ "n", "x", "o" },
			"]m",
			goto_next_start("@function.outer"),
			{ desc = "Next method/function def start" }
		)
		vim.keymap.set({ "n", "x", "o" }, "]c", goto_next_start("@class.outer"), { desc = "Next class start" })
		vim.keymap.set(
			{ "n", "x", "o" },
			"]i",
			goto_next_start("@conditional.outer"),
			{ desc = "Next conditional start" }
		)
		vim.keymap.set({ "n", "x", "o" }, "]l", goto_next_start("@loop.outer"), { desc = "Next loop start" })
		vim.keymap.set({ "n", "x", "o" }, "]F", goto_next_end("@call.outer"), { desc = "Next function call end" })
		vim.keymap.set(
			{ "n", "x", "o" },
			"]M",
			goto_next_end("@function.outer"),
			{ desc = "Next method/function def end" }
		)
		vim.keymap.set({ "n", "x", "o" }, "]C", goto_next_end("@class.outer"), { desc = "Next class end" })
		vim.keymap.set({ "n", "x", "o" }, "]I", goto_next_end("@conditional.outer"), { desc = "Next conditional end" })
		vim.keymap.set({ "n", "x", "o" }, "]L", goto_next_end("@loop.outer"), { desc = "Next loop end" })

		vim.keymap.set({ "n", "x", "o" }, "[f", goto_prev_start("@call.outer"), { desc = "Prev function call start" })
		vim.keymap.set(
			{ "n", "x", "o" },
			"[m",
			goto_prev_start("@function.outer"),
			{ desc = "Prev method/function def start" }
		)
		vim.keymap.set({ "n", "x", "o" }, "[c", goto_prev_start("@class.outer"), { desc = "Prev class start" })
		vim.keymap.set(
			{ "n", "x", "o" },
			"[i",
			goto_prev_start("@conditional.outer"),
			{ desc = "Prev conditional start" }
		)
		vim.keymap.set({ "n", "x", "o" }, "[l", goto_prev_start("@loop.outer"), { desc = "Prev loop start" })

		vim.keymap.set({ "n", "x", "o" }, "[F", goto_prev_end("@call.outer"), { desc = "Prev function call end" })
		vim.keymap.set(
			{ "n", "x", "o" },
			"[M",
			goto_prev_end("@function.outer"),
			{ desc = "Prev method/function def end" }
		)
		vim.keymap.set({ "n", "x", "o" }, "[C", goto_prev_end("@class.outer"), { desc = "Prev class end" })
		vim.keymap.set({ "n", "x", "o" }, "[I", goto_prev_end("@conditional.outer"), { desc = "Prev conditional end" })
		vim.keymap.set({ "n", "x", "o" }, "[L", goto_prev_end("@loop.outer"), { desc = "Prev loop end" })

		local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
	end,
}
