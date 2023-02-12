return {
  -- Doesn't seem to work with the keybindings...
  -- { "kana/vim-textobj-user" },
  -- {
  --   "kana/vim-textobj-line",
  --   dependencies = { "vim-textobj-user" },
  -- },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    -- opts = {
    --   opleader = {
    --     line = "<leader>c",
    --   },
    -- },
  },

  { "farmergreg/vim-lastplace" },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      require("which-key").register({
        ["<leader>"] = {
          ["1"] = "which_key_ignore",
          ["2"] = "which_key_ignore",
          ["3"] = "which_key_ignore",
          ["4"] = "which_key_ignore",
          ["5"] = "which_key_ignore",
          ["6"] = "which_key_ignore",
          ["7"] = "which_key_ignore",
          ["8"] = "which_key_ignore",
          ["9"] = "which_key_ignore",
          ["0"] = "which_key_ignore",
          ["$"] = "which_key_ignore",
        },
      }),
    },
  },
}
