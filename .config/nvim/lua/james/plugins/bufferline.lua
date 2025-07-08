return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			mode = "tabs",
			themeable = true,
			show_close_icon = false,
			show_buffer_close_icons = false,
			separator_style = "line",
			text_align = "center",
			indicator = {
				style = "none",
			},
		},
	},
}
