return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	enabled = false,
	config = function()
		require("nightfox").setup({
			options = {
				-- Compiled file's destination location
				compile_path = vim.fn.stdpath("cache") .. "/nightfox",
				compile_file_suffix = "_compiled", -- Compiled file suffix
				transparent = true, -- Disable setting background
				terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
				dim_inactive = false, -- Non focused panes set to alternative background
				module_default = true, -- Default enable value for modules
				styles = {
					comments = "italic", -- Value is any valid attr-list value `:help attr-list`
					conditionals = "NONE",
					constants = "NONE",
					functions = "NONE",
					keywords = "NONE",
					numbers = "NONE",
					operators = "NONE",
					strings = "NONE",
					types = "NONE",
					variables = "NONE",
				},
			},

			style = "nightfox",
			-- transparent = transparent,
			-- styles = {
			-- 	sidebars = transparent and "transparent" or "dark",
			-- 	floats = transparent and "transparent" or "dark",
			-- },
			specs = {
				-- As with palettes, the values defined under `all` will be applied to every style.
				all = {
					syntax = {
						-- Specs allow you to define a value using either a color or template. If the string does
						-- start with `#` the string will be used as the path of the palette table. Defining just
						-- a color uses the base version of that color.
						keyword = "magenta",

						-- Adding either `.bright` or `.dim` will change the value
						conditional = "magenta.bright",
						-- number = "orange.dim",
						number = "#ff828f",
					},
					git = {
						-- A color define can also be used
						changed = "#f4a261",
					},
				},
				nightfox = {
					syntax = {
						-- As with palettes, a specific style's value will be used over the `all`'s value.
						operator = "orange",
					},
				},
			},
		})

		-- vim.cmd("colorscheme nightfox")
	end,
}
