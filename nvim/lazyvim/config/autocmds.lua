-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd("let g:vimtex_quickfix_mode=0")
vim.cmd("let g:vimtex_quickfix_open_on_warning=0")
vim.cmd("let g:vimtex_mappings_prefix='<leader>\\'")
-- vim.cmd("set conceallevel=2")

vim.cmd("set backup")
vim.cmd("set backupdir=~/.config/nvim/backups/")
vim.cmd("set writebackup")
vim.cmd("set backupcopy=yes")
vim.cmd("au BufWritePre * let &bex = '@' . strftime(\"%F.%H:%M\")")
-- https://github.com/rcarriga/nvim-notify/issues/159
vim.api.nvim_set_hl(0, "NotifyBackground", { fg = "#ffffff", bg = "#333333" })
vim.cmd("set sessionoptions+=globals")

-- Fixes Autocomment
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "dap-float",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "dap-terminal",
  },
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>bdelete!<cr>", { buffer = event.buf, silent = true })
  end,
})
