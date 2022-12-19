local cmp = require "cmp"

local config = {
  options = {
    opt = {
      cmdheight = 1,
    },
  },

  lsp = {
    skip_setup = { "rust_analyzer", "tsserver" }, -- will be set up by rust-tools & the typescript plugin
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
      { "sheerun/vim-polyglot" },
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
      {
        "jose-elias-alvarez/typescript.nvim",
        after = "mason-lspconfig.nvim",
        config = function()
          require("typescript").setup {
            server = astronvim.lsp.server_settings "tsserver",
          }
        end,
      },
      {
        "Saecki/crates.nvim",
        after = "nvim-cmp",
        config = function()
          require("crates").setup()
          astronvim.add_cmp_source { name = "crates", priority = 1100 }

          -- Crates mappings:
          local map = vim.api.nvim_set_keymap
          map("n", "<leader>Ct", ":lua require('crates').toggle()<cr>", { desc = "Toggle extra crates.io information" })
          map("n", "<leader>Cr", ":lua require('crates').reload()<cr>", { desc = "Reload information from crates.io" })
          map("n", "<leader>CU", ":lua require('crates').upgrade_crate()<cr>", { desc = "Upgrade a crate" })
          map("v", "<leader>CU", ":lua require('crates').upgrade_crates()<cr>", { desc = "Upgrade selected crates" })
          map("n", "<leader>CA", ":lua require('crates').upgrade_all_crates()<cr>", { desc = "Upgrade all crates" })
        end,
      },
      {
        "ggandor/leap.nvim",
        config = function() require("leap").set_default_keymaps() end,
      },
    },

    ["mason-lspconfig"] = {
      ensure_installed = { "rust_analyzer", "tsserver" }, -- install rust_analyzer
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
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      local vale = null_ls.builtins.diagnostics.vale
      vale["filetypes"] = { "markdown", "tex", "asciidoc", "html" }
      -- Check supported formatters and linters
      config.sources = {
        null_ls.builtins.code_actions.shellcheck,
        -- Set a linter
        -- null_ls.builtins.diagnostics.actionlint, -- for github actions
        null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.diagnostics.fish, -- doubt i'll need this
        -- null_ls.builtins.diagnostics.gitlint, -- for git commit messages
        -- null_ls.builtins.diagnostics.luacheck, -- idk i have lua language server
        -- null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.shellcheck,
        -- vale, -- not too sure what this is
        -- null_ls.builtins.diagnostics.vulture, -- for python dead code
        null_ls.builtins.diagnostics.yamllint,
        -- Set a formatter
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.jq,
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.shellharden,
        -- null_ls.builtins.formatting.stylua, -- lua formatter, in rust
      }
      return config
    end,
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
