-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
if vim.fn.executable("gitui") == 1 then
  -- gitui instead of lazygit
  vim.keymap.set("n", "<leader>gg", function()
    require("lazyvim.util").float_term({ "gitui" })
  end, { desc = "gitui (cwd)" })
  vim.keymap.set("n", "<leader>gG", function()
    require("lazyvim.util").float_term({ "gitui" }, { cwd = require("lazyvim.util").get_root() })
  end, { desc = "gitui (root dir)" })
end

if vim.fn.executable("btop") == 1 then
  -- btop
  vim.keymap.set("n", "<leader>xb", function()
    require("lazyvim.util").float_term({ "btop" })
  end, { desc = "btop" })
end

-- make ctrl + backspace work
vim.keymap.set("n", "<C-h>", "<C-W>")
vim.keymap.set("n", "<C-BS>", "<C-W>")
vim.keymap.set("n", "<M-BS>", "<C-W>")

-- ctrl + backspace
vim.keymap.set("i", "<C-H>", "<C-W>")
-- when in visual mode, pasting will not overwrite the paste register
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "which_key_ignore" })

vim.keymap.set(
  { "n" },
  "<leader>1",
  "<Cmd>BufferLineGoToBuffer 1<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>2",
  "<Cmd>BufferLineGoToBuffer 2<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>3",
  "<Cmd>BufferLineGoToBuffer 3<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>4",
  "<Cmd>BufferLineGoToBuffer 4<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>5",
  "<Cmd>BufferLineGoToBuffer 5<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>6",
  "<Cmd>BufferLineGoToBuffer 6<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>7",
  "<Cmd>BufferLineGoToBuffer 7<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>8",
  "<Cmd>BufferLineGoToBuffer 8<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>9",
  "<Cmd>BufferLineGoToBuffer 9<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>$",
  "<Cmd>BufferLineGoToBuffer -1<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)
vim.keymap.set(
  { "n" },
  "<leader>0",
  "<Cmd>BufferLineGoToBuffer -1<CR>",
  { desc = "which_key_ignore", silent = true, noremap = true }
)

vim.keymap.set({ "n" }, "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment linewise" })
vim.keymap.set({ "x" }, "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment linewise" })
vim.keymap.set({ "n" }, "<leader>f/", require("lazyvim.util").telescope("live_grep"), { desc = "Find in Files (Grep)" })

vim.keymap.set({ "n" }, "<leader><tab>>", "<CMD>BufferLineMoveNext<CR>", { desc = "Move tab right" })
vim.keymap.set({ "n" }, "<leader><tab><", "<CMD>BufferLineMovePrev<CR>", { desc = "Move tab right" })
vim.keymap.set({ "n" }, ">b", "<CMD>BufferLineMoveNext<CR>", { desc = "Move tab right" })
vim.keymap.set({ "n" }, "<b", "<CMD>BufferLineMovePrev<CR>", { desc = "Move tab left" })

vim.keymap.set({ "n" }, "gS", "<Plug>(leap-from-window)", { desc = "Leap from window", noremap = false })

vim.keymap.set({ "x" }, "s", [[:<C-u>lua require('mini.surround').add('visual')<CR>]], { noremap = false })
vim.keymap.set({ "x" }, "gs", "<Plug>(leap-forward-to)", { desc = "Leap", noremap = false, silent = true })

vim.keymap.set({ "n" }, "<F7>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })