-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- make ctrl + backspace work
vim.keymap.set("n", "<C-h>", "<C-W>")
vim.keymap.set("n", "<C-BS>", "<C-W>")
vim.keymap.set("n", "<M-BS>", "<C-W>")
-- ctrl + backspace
vim.keymap.set("i", "<C-H>", "<C-W>")
-- when in visual mode, pasting will not overwrite the paste register
vim.keymap.set("v", "<leader>p", '"_dP')

vim.keymap.set({ "n" }, "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>0", "<Cmd>BufferLineGoToBuffer -1<CR>", { silent = true, noremap = true })
-- maps ctrl + forward slash
vim.keymap.set({ "i" }, "<C-_>", "<Plug>(comment_toggle_linewise)")
vim.keymap.set({ "n" }, "<C-_>", "<Plug>(comment_toggle_linewise)")

-- *<Plug>(comment_toggle_blockwise)*
