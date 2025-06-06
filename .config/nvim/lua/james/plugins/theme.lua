return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		config = function()
			vim.g.kanagawabones_darken_comments = 45
			vim.g.kanagawabones_darken_comments = 45
			vim.g.kanagawabones_transparent_background = true
			-- vim.g.zenbones = { transparent_background = true }
			vim.o.background = "dark"
			vim.cmd.colorscheme("kanagawabones")
		end,
	},
}
