-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
	-- VSCode extension
else
	require("config.lazy")
	-- ordinary Neovim
end
