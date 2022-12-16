local cmp = require "cmp"
local config = {
  plugins = {
    init = {
      { "farmergreg/vim-lastplace" },
      { "tpope/vim-surround" },
      {
        "declancm/cinnamon.nvim",
        config = function()
          require('cinnamon').setup {
            extra_keymaps = true,
            extended_keymaps = true,
            override_keymaps = true,
            -- max_length = -1, -- default
            always_scroll = true,
            scroll_limit = -1,
          }
        end,
      },
      -- {
      --   "pocco81/auto-save.nvim",
      --   config = function()
      --     require("auto-save").setup {
      --       trigger_events = {"FocusLost", "TabLeave"}
      --     }
      --   end,
      -- },
      -- { "sainnhe/sonokai" },
    },
  },

  cmp.setup {
    completion = {
      completeopt = 'menu,menuone,noinsert'
    }
  },

  mappings = {
    n = {
      -- ["<C-d>"] = { "<C-d>zz" },
      ["<C-h>"] = { "<C-W>" },
      ["<C-BS>"] = { "<C-W>" },
      ["<M-BS"] = { "<C-W>" },
    }
  },

  -- Add ctrl + backspace in insert mode
  vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true }),
  -- smooth scrolling for insert mode pageup and down too
  vim.keymap.set({ 'i' }, '<PageUp>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>"),
  vim.keymap.set({ 'i' }, '<PageDown>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>"),

  -- colorscheme = "sonokai",
  -- options = {
  --   g = {
  --     sonokai_style = "shusia"
  --   }
  -- },
  -- highlights = {
  --   -- apply highlight group to all colorschemes (include the default_theme)
  --   init = {
  --     -- set the transparency for all of these highlight groups
  --     Normal = { bg = "NONE", ctermbg = "NONE" },
  --     NormalNC = { bg = "NONE", ctermbg = "NONE" },
  --     CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
  --     CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
  --     CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
  --     LineNr = {},
  --     SignColumn = {},
  --     StatusLine = {},
  --     NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
  --     NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
  --   },
  -- },
}
return config
