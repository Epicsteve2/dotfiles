-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- paste without yanking
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "which_key_ignore" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "which_key_ignore" })

-- move tabs
vim.keymap.set({ "n" }, "<leader><tab>>", "<CMD>BufferLineMoveNext<CR>", { desc = "Move tab right" })
vim.keymap.set({ "n" }, "<leader><tab><", "<CMD>BufferLineMovePrev<CR>", { desc = "Move tab right" })

-- ctrl-backspace
vim.keymap.set("i", "<C-H>", "<C-W>")

-- for vim tmux
vim.keymap.set("n", "<C-h>", require("nvim-tmux-navigation").NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", require("nvim-tmux-navigation").NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", require("nvim-tmux-navigation").NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", require("nvim-tmux-navigation").NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", require("nvim-tmux-navigation").NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", require("nvim-tmux-navigation").NvimTmuxNavigateNext)
-- vim.keymap.del({ "x", "n", "i", "v" }, "<leader>/")
-- vim.keymap.set({ "n" }, "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment linewise" })
-- vim.keymap.set({ "x" }, "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment linewise" })
-- vim.keymap.set({ "n" }, "<leader>f/", require("lazyvim.util").telescope("live_grep"), { desc = "Find in Files (Grep)" })
-- vim.keymap.set(
--   { "n" },
--   "<leader>f<space>",
--   require("lazyvim.util").telescope("files"),
--   { desc = "Find Files (root dir)" }
-- )

-- vim.keymap.set({ "n" }, ">b", "<CMD>BufferLineMoveNext<CR>", { desc = "Move tab right" })
-- vim.keymap.set({ "n" }, "<b", "<CMD>BufferLineMovePrev<CR>", { desc = "Move tab left" })

-- vim.keymap.set({ "n" }, "gS", "<Plug>(leap-from-window)", { desc = "Leap from window", noremap = false })

-- vim.keymap.set({ "x" }, "s", [[:<C-u>lua require('mini.surround').add('visual')<CR>]], { noremap = false })
-- vim.keymap.set({ "x" }, "gs", "<Plug>(leap-forward-to)", { desc = "Leap", noremap = false, silent = true })

-- vim.keymap.set(
--   { "n" },
--   "<leader>1",
--   "<Cmd>BufferLineGoToBuffer 1<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
-- vim.keymap.set(
--   { "n" },
--   "<leader>2",
--   "<Cmd>BufferLineGoToBuffer 2<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
-- vim.keymap.set(
--   { "n" },
--   "<leader>3",
--   "<Cmd>BufferLineGoToBuffer 3<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
-- vim.keymap.set(
--   { "n" },
--   "<leader>4",
--   "<Cmd>BufferLineGoToBuffer 4<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
-- vim.keymap.set(
--   { "n" },
--   "<leader>5",
--   "<Cmd>BufferLineGoToBuffer 5<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
-- vim.keymap.set(
--   { "n" },
--   "<leader>6",
--   "<Cmd>BufferLineGoToBuffer 6<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
-- vim.keymap.set(
--   { "n" },
--   "<leader>7",
--   "<Cmd>BufferLineGoToBuffer 7<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
-- vim.keymap.set(
--   { "n" },
--   "<leader>8",
--   "<Cmd>BufferLineGoToBuffer 8<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
-- vim.keymap.set(
--   { "n" },
--   "<leader>9",
--   "<Cmd>BufferLineGoToBuffer 9<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
-- vim.keymap.set(
--   { "n" },
--   "<leader>$",
--   "<Cmd>BufferLineGoToBuffer -1<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
-- vim.keymap.set(
--   { "n" },
--   "<leader>0",
--   "<Cmd>BufferLineGoToBuffer -1<CR>",
--   { desc = "which_key_ignore", silent = true, noremap = true }
-- )
