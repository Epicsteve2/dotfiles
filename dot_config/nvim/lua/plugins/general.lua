return {

	{ "kmonad/kmonad-vim" },
	{ "imsnif/kdl.vim" },
	{ "alexghergh/nvim-tmux-navigation" },
	{ "ibhagwan/fzf-lua", opts = {
		winopts = { height = 1, width = 1 },
	} },
	{ "NoahTheDuke/vim-just" },
	{
		"zbirenbaum/copilot.lua",
		opts = {
			filetypes = {
				-- yaml = false,
				markdown = false,
				-- help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				-- svn = false,
				-- cvs = false,
				-- ["."] = false,
				["*.txt"] = false,
				python = function()
					-- run lua in the command line to test. also just run `:lua print(vim.api.nvim_buf_get_name(0))` in vim
					if string.match(vim.api.nvim_buf_get_name(0), "python%-%leetcode/src") then
						return false
					end
					return true
				end,
			},
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "melange",
			colorscheme = "gruvbox",
		},
	},
	-- {
	-- 	"savq/melange-nvim",
	-- },
	{ "ellisonleao/gruvbox.nvim", opts = {
		transparent_mode = false,
	} },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	opts = {
	-- 		transparent = true,
	-- 		styles = {
	-- 			sidebars = "transparent",
	-- 			floats = "transparent",
	-- 		},
	-- 		-- make line number prettier
	-- 		on_highlights = function(hl, colors)
	-- 			hl.CursorLineNr = {
	-- 				fg = "#FFba00",
	-- 			}
	-- 			-- idk but this isn't working
	-- 			-- hl.LineNr = {
	-- 			-- 	fg = colors.orange,
	-- 			-- }
	-- 			hl.LineNrAbove = { fg = "#5081c0" }
	-- 			hl.LineNrBelow = { fg = "#5081c0" }
	-- 		end,
	-- 		-- on_colors = function(colors)
	-- 		-- 	-- vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
	-- 		-- 	-- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#5081c0" })
	-- 		-- 	-- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#5081c0" })
	-- 		-- 	-- colors.fg_gutter = "#5081c0"
	-- 		-- end,
	-- 	},
	-- },

	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	-- enabled = false,
	-- 	-- event = "BufRead",
	-- 	-- lazy = false,
	-- 	opts = {
	-- 		highlight = {
	-- 			-- enable = false,
	-- 			-- this is LAGGY AF
	-- 			-- disable = { "markdown" },
	--
	-- 			-- source, kinda https://www.reddit.com/r/neovim/comments/yxjrkr/comment/iwsxikt/?utm_source=reddit&utm_medium=web2x&context=3
	-- 			disable = function(_, _)
	-- 				-- not working rn for some reason...
	-- 				return vim.fn.expand("%:p") == "/home/stephen/code-monkey/dotfiles-private/vns.md"
	-- 				-- local buf_name = vim.api.nvim_buf_get_name(bufnr)
	-- 				-- local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
	-- 				-- return file_size > 256 * 1024
	-- 			end,
	-- 		},
	-- 	},
	-- },
	-- fixing rust plugin cuz i think it's cuz the rust-analyzer is installed locally or smth
	-- source https://github.com/mrcjkb/rustaceanvim/blob/af4de6a35d128ce71c75a9a7846bf089aea76f50/doc/mason.txt#L40-L53
	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				rust_analyzer = function()
					return true
				end,
			},
		},
	},
}
