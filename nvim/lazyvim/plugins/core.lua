-- TODO
-- ~Fix surround~
-- keybind for saving sessions (maybe not a thing)
-- or at least tab order
--
return {
  -- Doesn't seem to work with the keybindings...
  { "kana/vim-textobj-user" },
  {
    "kana/vim-textobj-line",
    dependencies = { "vim-textobj-user" },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      -- on_highlights = function(highlights, colors)
      --   highlights.NotifyBackground = {
      --     bg = colors.none,
      --     fg = colors.none,
      --   }
      -- end,
    },
  },
  { "famiu/bufdelete.nvim" },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   opts = {
  --     contrast = "hard",
  --     transparent_mode = true,
  --   },
  -- },

  -- Configure LazyVim to load gruvbox
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox",
  --   },
  -- },
  {
    "numToStr/Comment.nvim",
    opts = {
      opleader = {
        line = "<leader>_",
      },
    },
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
    config = function()
      vim.keymap.del({ "n" }, "<leader>/")
    end,
  },
  {
    "echasnovski/mini.surround",
    -- enabled = false,
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
  -- {
  --   "ggandor/leap.nvim",
  --   keys = {
  --     { "s", false },
  --   },
  -- },
  -- {
  --   "kylechui/nvim-surround",
  -- },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", "勒" .. " Restore Last Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button(
          "S",
          "" .. " Restore CWD Session",
          [[<cmd>lua require("persistence").load({ last = true })<cr>]]
        ),
        dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
    end,
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   config = function()
  --     vim.keymap.del({ "n" }, "<leader>/")
  --   end,
  -- },
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
