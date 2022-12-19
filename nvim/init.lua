local cmp = require "cmp"

local config = {
  options = {
    opt = {
      cmdheight = 1,
    },
  },

  lsp = {
    skip_setup = { "rust_analyzer" }, -- will be set up by rust-tools & the typescript plugin
    ["server-settings"] = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            completion = {
              postfix = {
                enable = false,
              },
            },
          },
        },
      },
    }
  },

  plugins = {
    init = {
      { "farmergreg/vim-lastplace" },
      {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup {} end,
      },
      {
        "declancm/cinnamon.nvim",
        config = function()
          require('cinnamon').setup {
            extra_keymaps = true,
            extended_keymaps = true,
            override_keymaps = true,
            always_scroll = true,
            scroll_limit = 250,
          }
        end,
      },
      {
        "simrat39/rust-tools.nvim",
        after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
        config = function()
          require("rust-tools").setup {
            server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
          }
        end,
      },
    },

    ["mason-lspconfig"] = {
      ensure_installed = { "rust_analyzer" }, -- install rust_analyzer
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

  cmp.setup {
    completion = {
      -- auto select first completion
      completeopt = 'menu,menuone,noinsert'
    },
  },
  cmp.setup.filetype({ 'markdown' }, {
    enabled = false,
  }),

  mappings = {
    n = {
      -- Make ctrl+backspace work
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
  highlights = {
    -- apply highlight group to all colorschemes (include the default_theme)
    init = {
      -- set the transparency for all of these highlight groups
      Normal = { bg = "NONE", ctermbg = "NONE" },
      NormalNC = { bg = "NONE", ctermbg = "NONE" },
      CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      LineNr = {},
      SignColumn = {},
      StatusLine = {},
      NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
      NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
    },
  },
}

return config
