-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown" },
	callback = function()
		vim.b.autoformat = false
	end,
})

-- autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
-- source https://github.com/LazyVim/LazyVim/issues/80#issuecomment-1478662212
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("timestamp_backupext", { clear = true }),
	desc = "Add timestamp to backup extension",
	pattern = "*",
	callback = function()
		vim.opt.backupext = "-" .. vim.fn.strftime("%Y%m%d%H%M")
	end,
})

-- wrap and check for spell in text
-- source https://github.com/LazyVim/LazyVim/blob/e7130c8250c403140ce504bde9e973d5a301ab4c/lua/lazyvim/config/autocmds.lua#L74
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = vim.api.nvim_create_augroup("wrap_diary", { clear = true }),
	pattern = { "*/home/stephen/MEGA/MEGAsync/Diary/**" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- -- autocommand to disable TSBuf on a file. doesn't really work tho
-- vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
-- 	-- group = vim.api.nvim_create_augroup("timestamp_backupext", { clear = true }),
-- 	-- desc = "Add timestamp to backup extension",
-- 	pattern = "/home/stephen/code-monkey/dotfiles-private/vns.md",
-- 	callback = function()
-- 		if vim.fn.exists(":TSBufDisable") then
-- 			vim.cmd("TSBufDisable autotag")
-- 			vim.cmd("TSBufDisable highlight")
-- 			vim.cmd("TSBufDisable incremental_selection")
-- 			vim.cmd("TSBufDisable indent")
-- 			vim.cmd("TSBufDisable playground")
-- 			vim.cmd("TSBufDisable query_linter")
-- 			vim.cmd("TSBufDisable rainbow")
-- 			vim.cmd("TSBufDisable refactor.highlight_definitions")
-- 			vim.cmd("TSBufDisable refactor.navigation")
-- 			vim.cmd("TSBufDisable refactor.smart_rename")
-- 			vim.cmd("TSBufDisable refactor.highlight_current_scope")
-- 			vim.cmd("TSBufDisable textobjects.swap")
-- 			vim.cmd("TSBufDisable textobjects.lsp_interop")
-- 			vim.cmd("TSBufDisable textobjects.select")
-- 			-- " exec 'TSBufDisable textobjects.move'
-- 		end
-- 	end,
-- })
