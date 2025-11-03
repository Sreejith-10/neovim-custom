return {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		-- opts = {
		-- 	flavor = "mocha",
		-- 	integrations = {
		-- 		bufferline = true,
		-- 	},
		-- },
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
}
