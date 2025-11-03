return {
	-- autoclose tags
	"windwp/nvim-ts-autotag",
	ft = { "html", "typescriptreact", "jsx", "tsx" },
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
}
