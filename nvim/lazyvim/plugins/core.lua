-- Nv commit is 175b8f1e55b476bd692fd871e948b73668fe2426
-- https://github.com/appelgriebsch/Nv/commit/175b8f1e55b476bd692fd871e948b73668fe2426
-- TODO
-- keybind for saving sessions (maybe not a thing)
-- or at least tab order
-- leap in visual is broken
-- leap gS is broken initially
-- checkhearth shows things
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
  -- { "famiu/bufdelete.nvim" },
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
  },

  { "farmergreg/vim-lastplace" },
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
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.buttons.val = {
        dashboard.button("p", " " .. " Open project", "<cmd>Telescope project display_type=full<cr>"),
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("z", " " .. " Find file different", "<cmd>cd $HOME/code-monkey | Telescope find_files<cr>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC | :cd %:p:h | Telescope file_browser<cr>"),
        dashboard.button("s", "勒" .. " Restore CWD Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button(
          "S",
          "l" .. " Restore Last Session",
          [[<cmd>lua require("persistence").load({ last = true })<cr>]]
        ),
        dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("m", " " .. " Mason", "<cmd>Mason<cr>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      opts.config.opts.setup = function()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          desc = "disable tabline for alpha",
          callback = function()
            vim.opt.showtabline = 0
          end,
        })
        vim.api.nvim_create_autocmd("BufUnload", {
          buffer = 0,
          desc = "enable tabline after alpha",
          callback = function()
            vim.opt.showtabline = 2
          end,
        })
      end
    end,
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
      -- vim.keymap.del({ "n" }, "gs")
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
