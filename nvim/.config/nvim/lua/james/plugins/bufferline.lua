return {
	"akinsho/bufferline.nvim",
	version = "*",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			mode = "tabs",
			themeable = false,
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
