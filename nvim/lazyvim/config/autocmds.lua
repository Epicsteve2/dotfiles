-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

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

-- TODO: maybe put this in keymaps.lua lol
-- Apparently this doesn't work in macros, so this is the fix
-- https://github.com/rhysd/clever-f.vim/issues/22#issuecomment-1043158334
vim.cmd("let g:clever_f_not_overwrites_standard_mappings = 1")
vim.cmd('map <expr> f reg_recording() .. reg_executing() == "" ? "<Plug>(clever-f-reset)<Plug>(clever-f-f)" : "f"')
vim.cmd('map <expr> F reg_recording() .. reg_executing() == "" ? "<Plug>(clever-f-reset)<Plug>(clever-f-F)" : "F"')
vim.cmd('map <expr> t reg_recording() .. reg_executing() == "" ? "<Plug>(clever-f-reset)<Plug>(clever-f-t)" : "t"')
vim.cmd('map <expr> T reg_recording() .. reg_executing() == "" ? "<Plug>(clever-f-reset)<Plug>(clever-f-T)" : "T"')
vim.cmd('map <expr> ; reg_recording() .. reg_executing() == "" ? "<Plug>(clever-f-repeat-forward)" : ";"')
vim.cmd('map <expr> , reg_recording() .. reg_executing() == "" ? "<Plug>(clever-f-repeat-back)" : ","')
