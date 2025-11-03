return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VeryLazy",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal", "quickfix" },
						},
					},
				})
			end,
			keys = {
                {"<leader>e",silent = true, desc = "Neo Tree"},
				{ "<leader>ew", ":Neotree toggle float<CR>", silent = true ,noremap = true, desc = "Float File Explorer"},
				{ "<leader>ee", ":Neotree toggle position=left<CR>", silent = true, desc = "Left File Explorer" },
				{
					"<leader>ngs",
					":Neotree float git_status<CR>",
					silent = true,
					desc = "Neotree Open Git Status Window",
				},
			},
		},
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			-- enable_normal_mode_for_inputs = false,                             -- Enable normal mode for input dialogs.
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
			sort_case_insensitive = false, -- used when sorting files and directories in the tree
			sort_function = nil, -- use a custom function for sorting files and directories in the tree
			-- sort_function = function (a,b)
			--       if a.type == b.type then
			--           return a.path > b.path
			--       else
			--           return a.type > b.type
			--       end
			--   end , -- this sorts files and directories descendantly
			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				indent = {
					indent_size = 2,
					padding = 1, -- extra padding on left hand side
					-- indent guides
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarkr",
					-- expander config, needed for nesting fles
					with_expanders = nil, -- if nil and file nesting is enabled, will enable expaners
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExander",
				},
				con = {
					folder_close = "",
					folder_oen = "",
					folder_mpty = "󰜌",
					-- The next two settings are only a fallback, if you use nvim-web-devicons and configure defalt icons there
					-- then these willnever be used.
				default = "*",
					highlight = "NeTreeFilIcon",
				},
			modified = {
					ymbol = "[+]",
					highlight = "NeTreeModfied",
				},
				name = {
					trailingslash = false,
					use_git_statuscolors = true,
					highlight = "NeTreeFilName",
				},
			git_status = {
				symbols = {
					-- Change type
						added = "", -- or "✚", but this is redundant info if you use git_status_clors on the name
						modified = "", -- or "", but this is redundant info if you use git_statuscolors on the name
						deleted = "✖", -- this can only be used in he git_status source
						renamed = "󰁕", -- this can only be used n the git_status soure
						-- Status type
						untracked = "",
						ignored = "",
						unstaged= "󰄱",
						stage = "",
					conflict = "",
					},
				},
				-- If you don't want to use these columns, you can set `enabled = flse` for each of tem individually
				ile_size = {
					enabled = true,
					required_width = 64, -- min width of indow rquired to sho this column
				},				type = {
					enabled = true,
					required_width = 122, -- min width of indow rquired to show this coumn
				},
				lastmodified = {
					enabled = true,
					required_width = 88, -- min width of indow rquired to show tis column
				},
			created = {
					enabled = true,
					required_width = 110, -- min width of indow rquired to show this colmn
				},
				symlin_target= {
				enabled = false,
				},
			},
			-- A list of functions, each rpresenting a global custom command
			-- that will be available in all sources (if not overriddn in `opts[source_name].commands`)
			-- see `h neo-tree-custom-ommands-global
			commands = {},
		window = {
				osition = "left",
				wdth = 40,
				mappin_options = {
					nremap =true,
					nowai = true,
				},
			mappings = {
					["space>"] = {
						"toggle_node",
						nowait = false, -- disable `nowait` if you have existing combos starting ith thischar that you want to use
					},
					["<2-LeftMouse>"]= "open",
					["<cr>"] = "open",
					["<esc>"] = "cancel", -- close review or floating neo-tree window
					["P"] = { "toggle_preview", config = { use_float = true } },
					["l"] = "open",
					["S"] = "open_slit",
					["s"] = "open_vsplit",
					-- "S"] = "split_with_window_picker",
					-- [s"] = "vsplit_with_window_piker",
					["t"] = "open_tabnew",
					-- ["<cr>"] = "open_drop"
					-- ["t"] = "open_tab_drop",
				["w"] = "open_with_window_picker",
					--["P"] = "toggle_preview", -- enter preview mode, which show the current node without fcusing
					["C"] = "close_node",
				-- ['C'] = 'close_all_subnodes,
					["z"] = "close_all_nodes",					--["Z"] = expand_all_noes",
					["a"] = {
						"add",
						-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:hneo-tree-file-actions` for details
						-- some commands may take optional config options, see`:h neo-tree-mappngs` for details
						config = {
							show_path = "none" -- "none, "relatve", "absolute"
						},
					},
					["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also spports BASH style braceexpansion.
					["d"] = "delete",
					["r"] = "rename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
					["c"] = "copy", -- takes text input for destination, also accepts the optional onfig.show_path opion like "add":
				-- ["c"] = {
				--  "copy",
					--  config = {
					--    show_path = "none -- "none","relative, "absolute"
					--  }
					--}
					["m"] = "move", -- takes text input for destination, also accepts the optional onfig.show_path option like "dd".
					["q"] = "clos_window",
					["R"] = "rfresh",
					["?"] = "show_elp",
					["<"] = "prev_sorce",
					[">"] = "next_source",
					["i"] = "show_file_details",
			},
			},
			nesing_rules = {},
			filsystem = {
				filtered_items = {
					visible = false, -- when true, they will just be dispayed differently than normalitems
					hide_dotfiles = fase,
					hide_gitignored = false,
					hide_hidden = false, -- only works on Wndows for hidden filesdirectories
					hde_by_name = {
					".DS_Store",
						"thumbs.db",
						"nde_modules",
						"__pycace__",
						"virtual_documents",
					".git",
					".pythonversion",
						".venv",
					},
					hide_by_pattrn = { -- uses glo style patterns
						--"*.meta"
						--"*/src/*/tsconfig.json",
					},
					always_show = { -- remains visible even if oter settings would normaly hide t
						--".gitignored",
					},
					never_show = { -- remains hidden even if visible is toggled o true, this override always_show
						--".DS_Stre",
						--"thumbs.db"
					},
					never_show_by_pattrn = { -- uses glob stle pattens
					--".null-ls_*",
					},
			},
				follow_current_file = {
					enabled = false, -- This will find and focus the fle in the active buffer every time
					--               -- the current fileis changed while the tree is open.
					leave_dirs_open = false, -- `false` closes auto expanded drs, suc as with `:Neotree reveal`
				},
				group_empty_dirs = false, -- when true, empy folders will be grouped together
				hijack_netrw_behavior = "open_default", -- netrw disabled,opening a directory opens neo-tree
				-- in whatever positon is specified in window.position
				-- "open_current",  -- netrw disabled, oening a directory opens within the
				-- window like netrw wuld, regardless of window.position
				-- "disabled",    -- netrw left alone, ne-tree does not handle opening dirs
				use_libuv_file_watcher = false, -- This will use the OS leel file watchers to detect changes
				-- insteadof relying on nim autocmd events.
				window = {
					mappings ={
						["<bs>"] = "navigte_up",
						["."] = "set_roo",
						["H"] = "toggle_hiddn",
						["/"] = "fuzzy_finder",
					["D"] = "fuzzy_finder_directory",
						["#"] = "fuzzy_sorter", -- fuzy sorting using the fzy algorithm
						 ["D"] = "fuzzy_sorter_directory",
						["f"] = "filter_on_submit",
						["<c-x>"] = "clear_filter",
					["[g"] = "prev_git_modified",
					["]g"] = "next_git_modified",
						["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
						["oc"] = { "oder_by_created", nowait = false },
						["od"] = { "orderby_diagnostics", nowait = false },
						["og"] = { "orde_by_git_status", nowait = false },
						["om"] = { "orer_by_modified", nowait = false },
						["on"] = {"order_by_name", nowait = false },
						["os"] = {"order_by_size", nowait = false },
						["ot"] = {"order_b_type", nowait = false },
					},
					fuzzy_finder_mappings = { -- define keymaps for filte popup window in fuzzy_finder_mode
					["<down>"] = "move_cursor_down",
					["<C-n>"] = "move_cursor_down",						
					["<up>"] = "move_cursor_up",
					["<-p>"] ="ove_cursor_up",
					},
				},

				commands = {}, -- Add a custom command or override a globl one sing the same fnction name
			},
			buffes = {
				follow_current_file = {
					enabled = true, -- This will find and focus the fle in the active buffer every time
					--              -- the current fileis changed while the tree is open.
					leave_dirs_open = false, -- `false` closes auto expanded drs, suc as with `:Neotree reveal`
				},
				group_empty_dirs = true, -- when true, empy folders will be grouped ogether
				shw_unloaded = true,
				window = {
					mappings ={
						["bd"] = "buffer_delete",
						["<bs>"] = "navigte_up",
						["."] = "set_root",
						["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
						["oc"] = { "oder_by_created", nowait = false },
						["od"] = { "orderby_diagnostics", nowait = false },
						["om"] = { "orer_by_modified", nowait = false },
						["on"] = {"order_by_name", nowait = false },
						["os"] = {"order_by_size", nowait = false },
						["ot"] = {"order_b_type",nowait= false },
					}
				},
			},
			git_status = {
				wndow = {
					postion = "float",
					mapping = {
						["A"] = "git_add_all",						
						["gu"] = "git_unstage_fil",
						["ga"] = "git_add_file",
						["gr"] = "git_revert_fle",
						["gc"] = "git_cmmit",
						["gp"] = "git_push",
					["gg"] = "git_commit_and_push",
						["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
						["oc"] = { "oder_by_created", nowait = false },
						["od"] = { "orderby_diagnostics", nowait = false },
						["om"] = { "orer_by_modified", nowait = false },
						["on"] = {"order_by_name", nowait = false },
						["os"] = {"order_by_size", nowait = false },
						["ot"] = {"order_b_type",nowait= false},
					},
				},
			},
		})

		vim.cmd [[nnoremap \ [:Neotree reveal<cr>]]
	end,
}
