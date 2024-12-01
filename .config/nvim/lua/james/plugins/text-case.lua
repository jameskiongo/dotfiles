return {
	"johmsalas/text-case.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	-- Author's Note: If default keymappings fail to register (possible config issue in my local setup),
	-- verify lazy loading functionality. On failure, disable lazy load and report issue
	-- lazy = false,
	config = function()
		require("textcase").setup({
			-- Set `default_keymappings_enabled` to false if you don't want automatic keymappings to be registered.
			default_keymappings_enabled = true,
			-- `prefix` is only considered if `default_keymappings_enabled` is true. It configures the prefix
			-- of the keymappings, e.g. `gau ` executes the `current_word` method with `to_upper_case`
			-- and `gaou` executes the `operator` method with `to_upper_case`.
			prefix = "gu",
			-- If `substitude_command_name` is not nil, an additional command with the passed in name
			-- will be created that does the same thing as "Subs" does.
			substitude_command_name = nil,
			-- By default, all methods are enabled. If you set this option with some methods omitted,
			-- these methods will not be registered in the default keymappings. The methods will still
			-- be accessible when calling the exact lua function e.g.:
			-- "<CMD>lua require('textcase').current_word('to_snake_case')<CR>"
			enabled_methods = {
				"to_upper_case",
				"to_lower_case",
				"to_snake_case",
				"to_camel_case",
			},
		})
		require("telescope").load_extension("textcase")
	end,
	cmd = { "TextCaseOpenTelescope", "Subs" },
	keys = {
		"gu",
		{ "guu", "<cmd>lua require('textcase').current_word('to_upper_case')<CR>" },
		{ "gus", "<cmd>lua require('textcase').current_word('to_lower_case')<CR>" },
		{ "guc", "<cmd>lua require('textcase').current_word('to_camel_case')<CR>" },
		{ "gusn", "<cmd>lua require('textcase').current_word('to_snake_case')<CR>" },
	},
}
