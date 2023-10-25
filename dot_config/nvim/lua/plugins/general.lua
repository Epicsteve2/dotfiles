return {

	{ "kmonad/kmonad-vim" },
	{ "alexghergh/nvim-tmux-navigation" },
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			-- make line number prettier
			on_highlights = function(hl, _)
				hl.CursorLineNr = {
					fg = "#FFba00",
				}
				hl.LineNr = {
					fg = "#5081c0",
				}
			end,
		},
	},
	-- super tab stuff
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji",
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						-- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
						cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- this way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			})

			-- this and the nvimtreesitter line is for vns.md. maybe there's a fix? idk
			-- nvm this isn't causing any lag
			-- cmp.setup.filetype("markdown", {
			-- 	enabled = false,
			-- })
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			highlight = {
				-- this is LAGGY AF
				-- disable = { "markdown" },

				-- source, kinda https://www.reddit.com/r/neovim/comments/yxjrkr/comment/iwsxikt/?utm_source=reddit&utm_medium=web2x&context=3
				disable = function()
					return vim.fn.expand("%:p") == "/home/stephen/code-monkey/dotfiles-private/vns.md"
					-- local buf_name = vim.api.nvim_buf_get_name(bufnr)
					-- local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
					-- return file_size > 256 * 1024
				end,
			},
		},
	},
}
