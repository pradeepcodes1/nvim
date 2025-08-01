return {
  ----------------------------------------
  -- Core UX
  ----------------------------------------
  { "nvim-lua/plenary.nvim" },           -- lua helpers
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-lualine/lualine.nvim", config = true },
  { "folke/which-key.nvim", event = "VeryLazy", config = true },
  { "nvim-telescope/telescope.nvim", tag = "0.1.6", 
  dependencies = { "plenary.nvim" },
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", ".git" }
    }
  }
},
  { "nvim-tree/nvim-tree.lua", cmd = "NvimTreeToggle", config = true },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "python", "java", "json", "yaml", "bash" },
        highlight = { enable = true },
      }
    end
  },

  -- Themes
  { "catppuccin/nvim", name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim"},
  { "EdenEast/nightfox.nvim" },
  {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
      config = {
        shortcut = {
        },
        week_header = {
          enable = false
        },
        header = {
          "Whether you think you can or think you can’t, you’re right"
        },
        footer = {
          "Happy Coding!",
        }
      },
      hide = {
        tabline = true,
        winbar = true,
        statusline = true,
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
},
  ----------------------------------------
  -- Git & coding aids
  ----------------------------------------
  { "lewis6991/gitsigns.nvim", event = "BufReadPre", config = true },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "numToStr/Comment.nvim", event = "VeryLazy", config = true },

  ----------------------------------------
  -- LSP, diagnostics, formatting
  ----------------------------------------
  -- TODO: I dont know why ensure_installed is not auto installing things.
  { "neovim/nvim-lspconfig" },
  { "mason-org/mason-lspconfig.nvim", 
  opts = {
    ensure_installed = { "lua_ls", "tsserver", "typescript-language-server", "pyright" },
  },
 dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
},
  { "j-hui/fidget.nvim", tag = "legacy", config = true },
  { "hrsh7th/nvim-cmp", dependencies = {
      "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"
    }
  },

  ----------------------------------------
  -- Java specifics
  ----------------------------------------
  { "mfussenegger/nvim-jdtls", ft = { "java" } },

  ----------------------------------------
  -- Python specifics
  ----------------------------------------
  { "linux-cultist/venv-selector.nvim", cmd = "VenvSelect", opts = { search_venv_managers = false } },

  {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- for example
    provider = "gemini",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
},
{'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  -- terminal
    {'akinsho/toggleterm.nvim', version = "*", opts = {
      
    }},
}

