return {
    {
        "nvim-treesitter/nvim-treesitter",
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function(_, opts)
            opts = opts or {}                                   -- Initialize opts as an empty table if nil
            opts.ensure_installed = opts.ensure_installed or {} -- Ensure it's a table
            vim.list_extend(opts.ensure_installed, {
                "blade",
                "php_only",
                "json",
            })
        end,
        dependencies = {
            "windwp/nvim-ts-autotag",
            "RRethy/nvim-treesitter-endwise",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
            "LiadOz/nvim-dap-repl-highlights",
            "tree-sitter/tree-sitter-json",
        },
        config = function(_, opts)
            vim.filetype.add({
                pattern = {
                    [".*%.blade%.php"] = "blade",
                },
            })

            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade",
            }

            require("nvim-treesitter.configs").setup(opts)
            require("nvim-treesitter.configs").setup({

                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },

                ensure_installed = {
                    "typescript",
                    "lua",
                    "query",
                    "javascript",
                    "php",
                    "html",
                    "css",
                    "phpdoc",
                    "json",
                    "blade",
                },
                autotag = {
                    enable = true,
                },
                endwise = {
                    enable = true,
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>ss",    -- seleciona a palavra
                        node_incremental = "<leader>si",  -- seleciona o bloco
                        scope_incremental = "<leader>sc", -- seleciona o escopo
                        node_decremental = "<leader>sd",  -- deseleciona o bloco
                    },
                },

                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                        selection_modes = {
                            ["@parameter.outer"] = "v",
                            ["@function.outer"] = "V",
                            ["@class.outer"] = "<c-v>",
                        },
                        include_surrounding_whitespace = true,
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
}
