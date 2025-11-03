-- Window management
-- vim.keymap.set("n", "<leader>w", "<C-w>", { noremap = true, silent = true, desc = "Window management" })
-- vim.keymap.set("n", "<leader>wv", "<C-w>v", { noremap = true, silent = true, desc = "Split vertically" }) -- split window vertically
-- vim.keymap.set("n", "<leader>wh", "<C-w>s", { noremap = true, silent = true, desc = "Split horizontally" }) -- split window horizontally
-- vim.keymap.set("n", "<leader>we", "<C-w>=", { noremap = true, silent = true, desc = "Split equally" }) -- make split windows equal width & height
-- vim.keymap.set("n", "<leader>wx", ":close<CR>", { noremap = true, silent = true, desc = "Close current window" }) -- close current split window

-- Horizontal split (like <C-w>s)
vim.keymap.set('n', '<leader>ws', '<C-w>s', { noremap = true, silent = true, desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wS', ':split<CR>', { noremap = true, silent = true, desc = 'Split and keep focus' })

-- Vertical split (like <C-w>v)  
vim.keymap.set('n', '<leader>wv', '<C-w>v', { noremap = true, silent = true, desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wV', ':vsplit<CR>', { noremap = true, silent = true, desc = 'Vertical split and keep focus' })

-- Split with specific file
vim.keymap.set('n', '<leader>wf', ':split ', { noremap = true, silent = true, desc = 'Split and open file' })
vim.keymap.set('n', '<leader>wF', ':vsplit ', { noremap = true, silent = true, desc = 'Vertical split and open file' })

-- New empty split
vim.keymap.set('n', '<leader>wn', ':new<CR>', { noremap = true, silent = true, desc = 'New horizontal window' })
vim.keymap.set('n', '<leader>wN', ':vnew<CR>', { noremap = true, silent = true, desc = 'New vertical window' })

-- Basic navigation (hjkl)
vim.keymap.set('n', '<leader>wh', '<C-w>h', { noremap = true, silent = true, desc = 'Go to left window' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true, desc = 'Go to down window' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true, desc = 'Go to up window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true, desc = 'Go to right window' })

-- Alternative navigation (arrow keys if you prefer)
vim.keymap.set('n', '<leader>w<left>', '<C-w>h', { noremap = true, silent = true, desc = 'Go to left window' })
vim.keymap.set('n', '<leader>w<down>', '<C-w>j', { noremap = true, silent = true, desc = 'Go to down window' })
vim.keymap.set('n', '<leader>w<up>', '<C-w>k', { noremap = true, silent = true, desc = 'Go to up window' })
vim.keymap.set('n', '<leader>w<right>', '<C-w>l', { noremap = true, silent = true, desc = 'Go to right window' })

-- Window cycling
vim.keymap.set('n', '<leader>ww', '<C-w>w', { noremap = true, silent = true, desc = 'Cycle to next window' })
vim.keymap.set('n', '<leader>wW', '<C-w>W', { noremap = true, silent = true, desc = 'Cycle to previous window' })
vim.keymap.set('n', '<leader>wp', '<C-w>p', { noremap = true, silent = true, desc = 'Go to previous window' })

-- Jump to specific windows
vim.keymap.set('n', '<leader>w1', '1<C-w>w', { noremap = true, silent = true, desc = 'Go to window 1' })
vim.keymap.set('n', '<leader>w2', '2<C-w>w', { noremap = true, silent = true, desc = 'Go to window 2' })
vim.keymap.set('n', '<leader>w3', '3<C-w>w', { noremap = true, silent = true, desc = 'Go to window 3' })
vim.keymap.set('n', '<leader>w4', '4<C-w>w', { noremap = true, silent = true, desc = 'Go to window 4' })

-- Closing windows
vim.keymap.set('n', '<leader>wc', '<C-w>c', { noremap = true, silent = true, desc = 'Close current window' })
vim.keymap.set('n', '<leader>wq', ':q<CR>', { noremap = true, silent = true, desc = 'Quit current window' })
vim.keymap.set('n', '<leader>wQ', ':q!<CR>', { noremap = true, silent = true, desc = 'Force quit window' })

-- Close others
vim.keymap.set('n', '<leader>wo', '<C-w>o', { noremap = true, silent = true, desc = 'Close other windows' })
vim.keymap.set('n', '<leader>wO', ':only<CR>', { noremap = true, silent = true, desc = 'Close other windows (force)' })

-- Close all but current
vim.keymap.set('n', '<leader>wa', function()
  local current_win = vim.api.nvim_get_current_win()
  local windows = vim.api.nvim_list_wins()
  
  for _, win in ipairs(windows) do
    if win ~= current_win then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { noremap = true, silent = true, desc = 'Close all other windows' })

-- Height resizing
vim.keymap.set('n', '<leader>w+', '<C-w>+', { noremap = true, silent = true, desc = 'Increase window height' })
vim.keymap.set('n', '<leader>w-', '<C-w>-', { noremap = true, silent = true, desc = 'Decrease window height' })

-- Width resizing  
vim.keymap.set('n', '<leader>w>', '<C-w>>', { noremap = true, silent = true, desc = 'Increase window width' })
vim.keymap.set('n', '<leader>w<', '<C-w><', { noremap = true, silent = true, desc = 'Decrease window width' })

-- Equalize sizes
vim.keymap.set('n', '<leader>w=', '<C-w>=', { noremap = true, silent = true, desc = 'Equalize window sizes' })

-- Max height/width
vim.keymap.set('n', '<leader>w_', ':resize 999<CR>', { noremap = true, silent = true, desc = 'Maximize window height' })
vim.keymap.set('n', '<leader>w|', ':vertical resize 999<CR>', { noremap = true, silent = true, desc = 'Maximize window width' })

-- Specific sizes
vim.keymap.set('n', '<leader>w10', ':resize 10<CR>', { noremap = true, silent = true, desc = 'Set height to 10' })
vim.keymap.set('n', '<leader>w20', ':resize 20<CR>', { noremap = true, silent = true, desc = 'Set height to 20' })
vim.keymap.set('n', '<leader>w30', ':resize 30<CR>', { noremap = true, silent = true, desc = 'Set height to 30' })

vim.keymap.set('n', '<leader>w010', ':vertical resize 10<CR>', { noremap = true, silent = true, desc = 'Set width to 10' })
vim.keymap.set('n', '<leader>w020', ':vertical resize 20<CR>', { noremap = true, silent = true, desc = 'Set width to 20' })
vim.keymap.set('n', '<leader>w030', ':vertical resize 30<CR>', { noremap = true, silent = true, desc = 'Set width to 30' })

-- Move windows
vim.keymap.set('n', '<leader>wH', '<C-w>H', { noremap = true, silent = true, desc = 'Move window to far left' })
vim.keymap.set('n', '<leader>wJ', '<C-w>J', { noremap = true, silent = true, desc = 'Move window to bottom' })
vim.keymap.set('n', '<leader>wK', '<C-w>K', { noremap = true, silent = true, desc = 'Move window to top' })
vim.keymap.set('n', '<leader>wL', '<C-w>L', { noremap = true, silent = true, desc = 'Move window to far right' })

-- Rotate windows
vim.keymap.set('n', '<leader>wr', '<C-w>r', { noremap = true, silent = true, desc = 'Rotate windows forward' })
vim.keymap.set('n', '<leader>wR', '<C-w>R', { noremap = true, silent = true, desc = 'Rotate windows backward' })

-- Exchange windows
vim.keymap.set('n', '<leader>wx', '<C-w>x', { noremap = true, silent = true, desc = 'Exchange window with next' })

-- Move to new tab
vim.keymap.set('n', '<leader>wt', '<C-w>T', { noremap = true, silent = true, desc = 'Move window to new tab' })

-- Quick window focus (useful for large setups)
vim.keymap.set('n', '<leader>wf', ':Windows<CR>', { noremap = true, silent = true, desc = 'Fuzzy find windows' })

-- Toggle between current and previous window
vim.keymap.set('n', '<leader>wb', '<C-w>p', { noremap = true, silent = true, desc = 'Toggle between windows' })

-- Quick window layout presets
vim.keymap.set('n', '<leader>w2', ':vs<CR>', { noremap = true, silent = true, desc = 'Two column layout' })
vim.keymap.set('n', '<leader>w3', ':vs<CR>:vs<CR>', { noremap = true, silent = true, desc = 'Three column layout' })

-- Zoom/unzoom window (toggle)
vim.keymap.set('n', '<leader>wz', '<C-w>_<C-w>|', { noremap = true, silent = true, desc = 'Zoom current window' })
vim.keymap.set('n', '<leader>wZ', '<C-w>=', { noremap = true, silent = true, desc = 'Unzoom all windows' })