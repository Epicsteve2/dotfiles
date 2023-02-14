-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd("set backup")
vim.cmd("set backupdir=~/.config/nvim/backups/")
vim.cmd("set writebackup")
vim.cmd("set backupcopy=yes")
vim.cmd("au BufWritePre * let &bex = '@' . strftime(\"%F.%H:%M\")")
-- https://github.com/rcarriga/nvim-notify/issues/159
vim.api.nvim_set_hl(0, "NotifyBackground", { fg = "#ffffff", bg = "#333333" })
vim.cmd("set sessionoptions+=globals")
