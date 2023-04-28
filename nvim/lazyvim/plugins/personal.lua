-- Nv commit is 11832e3056908ffed1fd07a61291efdbec80c76c
-- TODO
-- tabbing for tab complete doesn't work initially. have to wait, or something. idk
-- fix cursor color on white space before first character
-- coding in latex, when i do a + <esc>, it would be really wonky sometimes. idk why
return {
  -- -- Doesn't seem to work with the keybindings...
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
      on_highlights = function(hl, colors)
        hl.CursorLineNr = {
          fg = "#FFba00",
        }
        hl.LineNr = {
          fg = "#5081c0",
        }
      end,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter",
  },
  { "ggandor/flit.nvim", enabled = false },
  {
    "rhysd/clever-f.vim",
  },
  {
    "numToStr/Comment.nvim",
  },

  -- {
  --   "telescope.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --     build = "make",
  --     config = function()
  --       require("telescope").load_extension("fzf")
  --     end,
  --   },
  --   config = function()
  --     vim.keymap.del({ "n" }, "<leader>/")
  --   end,
  -- },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
    -- keys = {
    --   { "gsa", false },
    -- },
  },
  {
    "lervag/vimtex",
  },
  {
    "ggandor/leap.nvim",
    event = "VimEnter",
    config = function()
      -- require("leap")
      require("leap").add_default_mappings()
      vim.keymap.del({ "x" }, "x")
      vim.keymap.del({ "x" }, "X")
    end,
  },
  {
    "folke/persistence.nvim",
    opts = {
      options = { "buffers", "curdir", "tabpages", "winsize", "globals" },
    },
  },
  -- {
  --   "folke/which-key.nvim",
  --   opts = {
  --     require("which-key").register({
  --       ["<leader>"] = {
  --         ["1"] = "which_key_ignore",
  --         ["2"] = "which_key_ignore",
  --         ["3"] = "which_key_ignore",
  --         ["4"] = "which_key_ignore",
  --         ["5"] = "which_key_ignore",
  --         ["6"] = "which_key_ignore",
  --         ["7"] = "which_key_ignore",
  --         ["8"] = "which_key_ignore",
  --         ["9"] = "which_key_ignore",
  --         ["0"] = "which_key_ignore",
  --         ["$"] = "which_key_ignore",
  --         ["p"] = "which_key_ignore",
  --       },
  --     }),
  --   },
  -- },
}
