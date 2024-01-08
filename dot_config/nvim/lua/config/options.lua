-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_mappings_prefix = "<leader>\\"
vim.g.vimtex_view_general_viewer = "okular"

vim.opt.conceallevel = 0

-- autowrite backups
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("$HOME/.cache/nvim/backups/")
-- can also do os.getenv("HOME") .. '/.vim/backup'
vim.opt.writebackup = true
vim.opt.backupcopy = "yes"
-- autocommand in the autocmds file

-- vim.opt.formatoptions = "jqlnt" -- removed 'cro'
vim.opt.formatoptions:remove({ "c", "r", "o" })

-- TODO, maybe
-- vim.cmd("au BufWritePre * let &bex = '@' . strftime(\"%F.%H:%M\")")
-- vim.cmd("autocmd BufNewFile,BufRead * setlocal formatoptions-=cro")
-- vim.cmd("set formatoptions-=cro")
-- vim.g.minipairs_disable = true
-- vim.opt.format
