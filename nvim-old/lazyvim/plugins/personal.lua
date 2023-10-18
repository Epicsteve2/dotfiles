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
    "kmonad/kmonad-vim",
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, _)
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
  },
  {
    "lervag/vimtex",
  },
  {
    "ggandor/leap.nvim",
    event = "VimEnter",
    config = function()
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
  -- copied from AstroNvim
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      size = 10,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = { border = "Normal", background = "Normal" },
      },
    },
  },
}
