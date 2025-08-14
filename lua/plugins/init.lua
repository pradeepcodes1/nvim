return {
    ----------------------------------------
    -- Core UX
    ----------------------------------------
    { "nvim-lua/plenary.nvim" }, -- lua helpers
    { "nvim-tree/nvim-web-devicons" },
    { "folke/which-key.nvim",       event = "VeryLazy", config = true },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "plenary.nvim" },
        opts = {
            defaults = {
                file_ignore_patterns = { "node_modules", ".git", "build" }
            }
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "lua", "python", "java", "json", "yaml", "bash" },
                highlight = { enable = true },
            }
        end
    },
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
                        "",
                    }
                },
                hide = {
                    tabline = true,
                    winbar = true,
                    statusline = true,
                }
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    ----------------------------------------
    -- Git & coding aids
    ----------------------------------------
    { "lewis6991/gitsigns.nvim", event = "BufReadPre",  config = true },
    { "windwp/nvim-autopairs",   event = "InsertEnter", config = true },
    { "numToStr/Comment.nvim",   event = "VeryLazy",    config = true },

    ----------------------------------------
    -- LSP, diagnostics, formatting
    ----------------------------------------
    -- TODO: I dont know why ensure_installed is not auto installing things.
    { "neovim/nvim-lspconfig" },
    { "j-hui/fidget.nvim",       tag = "legacy",        config = true },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"
        }
    },

    ----------------------------------------
    -- Java specifics
    ----------------------------------------
    { "mfussenegger/nvim-jdtls",          ft = { "java" } },

    ----------------------------------------
    -- Python specifics
    ----------------------------------------
    { "linux-cultist/venv-selector.nvim", cmd = "VenvSelect", opts = { search_venv_managers = false } },

    -- terminal

}
