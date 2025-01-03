return {
	"p00f/clangd_extensions.nvim",
	lazy = true,
	config = function()
		-- require("clangd_extensions").setup({
		-- require("clangd_extensions").setup()
	end,
	opts = {
		inlay_hints = {
			inline = false,
		},
		ast = {
			--These require codicons (https://github.com/microsoft/vscode-codicons)
			role_icons = {
				type = "",
				declaration = "",
				expression = "",
				specifier = "",
				statement = "",
				["template argument"] = "",
			},
			kind_icons = {
				Compound = "",
				Recovery = "",
				TranslationUnit = "",
				PackExpansion = "",
				TemplateTypeParm = "",
				TemplateTemplateParm = "",
				TemplateParamObject = "",
			},
		},
	},
}
