require("core.options") -- Load general options
require("core.keymaps.default") -- Load default keymaps
require("core.keymaps.window") -- Load window keymaps
require("core.keymaps.buffer") -- Load buffer keymaps
require("core.snippets") -- Custom code snippets
require("core.autocmds") -- Custom autocommands

-- Install package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
	require("plugins.telescope"),
	require("plugins.catppuccin"),
	require("plugins.conform"),
	require("plugins.linting"),
	require("plugins.treesitter"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.lualine"),
	require("plugins.bufferline"),
	require("plugins.neo-tree"),
	require("plugins.alpha"),
	require("plugins.indent-blankline"),
	require("plugins.lazygit"),
	require("plugins.comments"),
	require("plugins.debug"),
	require("plugins.gitsigns"),
	require("plugins.miscallaneous"),
	require("plugins.aerial"),
	require("plugins.mini-icon"),
	require("plugins.inline-diagnostics"),
	require("plugins.auto-pairs"),
	require("plugins.auto-tag"),
	require("plugins.todo-comments"),
	require("plugins.colorizer"),
	require("plugins.which-key"),
	require("plugins.mini-surround"),
	require("plugins.kanagawa"),
	require("plugins.flash"),
	require("plugins.mini-animate"),
	require("plugins.lackluster-colorscheme"),
	require("plugins.inline-hints"),
}, {
	ui = {
		-- If you have a Nerd Font, set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- Function to check if a file exits
local function file_exists(file)
	local f = io.open(file, "r")
	if f then
		f:close()
		return true
	else
		return false
	end
end

-- Path to the session file
local session_file = ".session.vim"

-- Check if the sessionfile exists in the current directoy
if file_exists(session_file) then
	-- Source the session file
	vim.cmd("source " .. session_file)
end

-- The line beneath this is caled `modeline`. See `:help odeline`
-- vim: ts=2 sts=2 sw=2 et
