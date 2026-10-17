return {
	"zenbones-theme/zenbones.nvim",
	dependencies = "rktjmp/lush.nvim",
	lazy = true, -- loads when `:colorscheme zenwritten` runs
	config = function()
		vim.g.zenbones_darken_comments = 45
	end,
}
