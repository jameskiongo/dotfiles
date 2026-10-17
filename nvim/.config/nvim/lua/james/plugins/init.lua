return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use

	"christoomey/vim-tmux-navigator", -- tmux & split window navigation

	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

	"szw/vim-maximizer",

	"tpope/vim-sleuth",

	{ "wakatime/vim-wakatime", event = "VeryLazy" },

	"vimpostor/vim-tpipeline",

	"alvan/vim-closetag",
	-- hardtime
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {},
	},
	-- mason workaround
	{ "mason-org/mason.nvim", version = "1.11.0" },
	{ "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
	-- nvim surround
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features

		config = true,
		-- TODO: check mini-surround, might be better suited, or explore this plugins help file
	},
	-- Render Markdown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	-- rustacean
	"mrcjkb/rustaceanvim",
	version = "^9", -- Recommended
	lazy = false, -- This plugin is already lazy
	enabled = true,
	["rust-analyzer"] = {
		cargo = {
			allFeatures = true,
		},
	},
	-- template string
	{
		"axelvc/template-string.nvim",
		event = "InsertEnter",
		ft = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		config = true, -- run require("template-string").setup()
	},
	-- tiney diagnostics
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		-- enabled = false,
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
		end,
	},
	-- tsc
	{
		"dmmulroy/tsc.nvim",
		cmd = { "TSC" },
		config = true,
	},
}
