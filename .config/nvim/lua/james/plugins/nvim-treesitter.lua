return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				-- autotag = {
				-- 	enable = true,
				-- },
				-- -- ensure these language parsers are installed
				auto_install = true,
				ensure_installed = {
					"tsx",
					"typescript",
					"javascript",
					"html",
					"css",
					"vue",
					"astro",
					"svelte",
					"gitcommit",
					"graphql",
					"json",
					"json5",
					"lua",
					"markdown",
					"prisma",
					"python",
					"http",
					"cpp",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})

			-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
			require("ts_context_commentstring").setup({})
		end,
	},
}
