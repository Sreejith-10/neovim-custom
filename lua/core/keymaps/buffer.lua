-- Buffers
-- vim.keymap.set("n", "<leader>x", "", { noremap = true, silent = true, desc = "Buffers" })
-- vim.keymap.set("n", "<leader>xn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
-- vim.keymap.set("n", "<leader>xp", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
-- vim.keymap.set("n", "<leader>xi", "<C-i>", { noremap = true, silent = true, desc = "Restore buffer" }) -- to restore jump forward
-- vim.keymap.set("n", "<leader>xx", ":Bdelete!<CR>", { noremap = true, silent = true, desc = "Close current buffer" }) -- close buffer
-- vim.keymap.set("n", "<leader>xc", "<cmd> enew <CR>", { noremap = true, silent = true, desc = "Create new buffer" }) -- new buffer

-- Next/previous buffer
vim.keymap.set("n", "<leader>xn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>xp", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>xN", ":bNext<CR>", { noremap = true, silent = true, desc = "Previous buffer (alt)" })

-- First/last buffer
vim.keymap.set("n", "<leader>xf", ":bfirst<CR>", { noremap = true, silent = true, desc = "First buffer" })
vim.keymap.set("n", "<leader>xl", ":blast<CR>", { noremap = true, silent = true, desc = "Last buffer" })

-- Specific buffer numbers
vim.keymap.set("n", "<leader>x1", ":b1<CR>", { noremap = true, silent = true, desc = "Buffer 1" })
vim.keymap.set("n", "<leader>x2", ":b2<CR>", { noremap = true, silent = true, desc = "Buffer 2" })
vim.keymap.set("n", "<leader>x3", ":b3<CR>", { noremap = true, silent = true, desc = "Buffer 3" })
vim.keymap.set("n", "<leader>x4", ":b4<CR>", { noremap = true, silent = true, desc = "Buffer 4" })
vim.keymap.set("n", "<leader>x5", ":b5<CR>", { noremap = true, silent = true, desc = "Buffer 5" })

-- Close current buffer
vim.keymap.set("n", "<leader>xc", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer" })
vim.keymap.set("n", "<leader>xq", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer (alt)" })
vim.keymap.set("n", "<leader>xQ", ":bdelete!<CR>", { noremap = true, silent = true, desc = "Force close buffer" })

-- Close all buffers except current
vim.keymap.set("n", "<leader>xo", ":%bd|e#<CR>", { noremap = true, silent = true, desc = "Close other buffers" })
vim.keymap.set("n", "<leader>xO", ":%bd!|e#<CR>", { noremap = true, silent = true, desc = "Force close other buffers" })

-- Close all buffers
vim.keymap.set("n", "<leader>xa", ":%bd<CR>", { noremap = true, silent = true, desc = "Close all buffers" })
vim.keymap.set("n", "<leader>xA", ":%bd!<CR>", { noremap = true, silent = true, desc = "Force close all buffers" })

-- Wipe buffer (remove from buffer list)
vim.keymap.set("n", "<leader>xw", ":bwipeout<CR>", { noremap = true, silent = true, desc = "Wipe buffer" })
vim.keymap.set("n", "<leader>xW", ":bwipeout!<CR>", { noremap = true, silent = true, desc = "Force wipe buffer" })

-- List buffers
vim.keymap.set("n", "<leader>xl", ":buffers<CR>", { noremap = true, silent = true, desc = "List buffers" })
vim.keymap.set("n", "<leader>xL", ":ls<CR>", { noremap = true, silent = true, desc = "List buffers (alt)" })

-- Buffer picker/fuzzy find
vim.keymap.set("n", "<leader>xb", ":buffer ", { noremap = true, silent = true, desc = "Switch to buffer by name" })
vim.keymap.set("n", "<leader>xf", ":b ", { noremap = true, silent = true, desc = "Find buffer by name" })

-- Quick buffer by number
vim.keymap.set(
	"n",
	"<leader>xs",
	":<C-u>buffer ",
	{ noremap = true, silent = true, desc = "Switch to buffer by number" }
)

-- New buffer
vim.keymap.set("n", "<leader>xn", ":enew<CR>", { noremap = true, silent = true, desc = "New empty buffer" })

-- Save buffer
vim.keymap.set("n", "<leader>xs", ":w<CR>", { noremap = true, silent = true, desc = "Save buffer" })
vim.keymap.set("n", "<leader>xS", ":wa<CR>", { noremap = true, silent = true, desc = "Save all buffers" })

-- Reload buffer
vim.keymap.set("n", "<leader>xr", ":e!<CR>", { noremap = true, silent = true, desc = "Reload buffer" })
vim.keymap.set(
	"n",
	"<leader>xR",
	":checktime<CR>",
	{ noremap = true, silent = true, desc = "Check for external changes" }
)

-- Rename buffer (change filename)
vim.keymap.set("n", "<leader>xm", ":saveas ", { noremap = true, silent = true, desc = "Rename/save as" })

-- Alternate buffer (switch to last used)
vim.keymap.set("n", "<leader>x<space>", "<C-^>", { noremap = true, silent = true, desc = "Toggle last buffer" })
vim.keymap.set("n", "<leader>xa", "<C-^>", { noremap = true, silent = true, desc = "Alternate buffer" })

-- Buffer in new tab
vim.keymap.set("n", "<leader>xt", ":tab sb<CR>", { noremap = true, silent = true, desc = "Buffer in new tab" })

-- Copy buffer to new split
vim.keymap.set("n", "<leader>xvs", ":sbuffer ", { noremap = true, silent = true, desc = "Buffer in horizontal split" })
vim.keymap.set(
	"n",
	"<leader>xvv",
	":vertical sbuffer ",
	{ noremap = true, silent = true, desc = "Buffer in vertical split" }
)

-- Move buffer to new window
vim.keymap.set("n", "<leader>xwm", "<C-w>T", { noremap = true, silent = true, desc = "Move buffer to new tab" })

-- Quick buffer cycling
vim.keymap.set("n", "<leader>xk", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>xj", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })

-- Buffer by pattern matching
vim.keymap.set("n", "<leader>x/", ":buf ", { noremap = true, silent = true, desc = "Find buffer by pattern" })

-- Quick access to common buffers
vim.keymap.set("n", "<leader>x0", ":b#<CR>", { noremap = true, silent = true, desc = "Last buffer" })
vim.keymap.set("n", "<leader>x-", ":b#<CR>", { noremap = true, silent = true, desc = "Previous buffer" })

-- Show buffer info
vim.keymap.set(
	"n",
	"<leader>xi",
	':echo bufname("%")<CR>',
	{ noremap = true, silent = true, desc = "Show buffer name" }
)
vim.keymap.set(
	"n",
	"<leader>xI",
	':echo bufnr("%")<CR>',
	{ noremap = true, silent = true, desc = "Show buffer number" }
)

-- Buffer diagnostics
vim.keymap.set(
	"n",
	"<leader>xd",
	":lua vim.diagnostic.open_float()<CR>",
	{ noremap = true, silent = true, desc = "Buffer diagnostics" }
)

-- Simple buffer picker using built-in commands
vim.keymap.set("n", "<leader>xB", function()
	vim.ui.input({ prompt = "Buffer number or name: " }, function(input)
		if input then
			vim.cmd("buffer " .. input)
		end
	end)
end, { noremap = true, silent = true, desc = "Interactive buffer picker" })
