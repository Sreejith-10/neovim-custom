return {
	-- autoclose tags
	"windwp/nvim-ts-autotag",
	ft = { "html", "typescriptreact", "jsx", "tsx" },
	config = function()
		require("nvim-ts-autotag").setup({
			filetypes = {
				"html",
				"jsx",
				"tsx",
				"javascriptreact",
				"typescriptreact",
			},
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = false,
			},
		})
	end,
}
