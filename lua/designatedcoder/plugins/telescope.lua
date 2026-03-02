return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    treesitter = false,
                    path_display = { "truncate " },
                    layout_config = {
                        horizontal = {
                            preview_cutoff = 0,
                        },
                    },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        theme = "ivy",
                    },
                    file_browser = {
                        theme = nil, -- Remova o tema padrão
                        layout_strategy = "horizontal",
                        layout_config = {
                            prompt_position = "top",
                            preview_width = 0.6,
                        },
                        sorting_strategy = "ascending",
                    },
                    buffers = {
                        theme = nil, -- Remova o tema padrão
                        layout_strategy = "horizontal",
                        layout_config = {
                            prompt_position = "top",
                            preview_width = 0.6,
                        },
                        sorting_strategy = "ascending",
                    },
                    live_grep = {
                        theme = "dropdown"
                    }, 
                    git_files = {
                        theme = nil, -- Remova o tema padrão
                        layout_strategy = "horizontal",
                        layout_config = {
                            prompt_position = "top",
                            preview_width = 0.6,
                        },
                        sorting_strategy = "ascending",
                    },
                    oldfiles = {
                        theme = nil, -- Remova o tema padrão
                        layout_strategy = "horizontal",
                        layout_config = {
                            prompt_position = "top",
                            preview_width = 0.6,
                        },
                        sorting_strategy = "ascending",
                    },
                    help_tags = {
                        theme = nil, -- Remova o tema padrão
                        layout_strategy = "horizontal",
                        layout_config = {
                            prompt_position = "top",
                            preview_width = 0.6,
                        },
                        sorting_strategy = "ascending",
                    },
                    live_grep = {
                        layout_strategy = "horizontal",
                    },
                },
                extensions = {
                    media_files = {
                        -- Tipos de arquivos suportados
                        filetypes = { "png", "jpg", "jpeg", "gif" },
                        -- Ferramenta de pré-visualização
                        find_cmd = "fd",
                    },
                },
            })
            vim.cmd([[
                highlight TelescopeNormal guibg=NONE guifg=#abb2bf
                highlight TelescopeBorder guibg=NONE guifg=#5c6370
                highlight TelescopePromptBorder guibg=NONE guifg=#61afef
                highlight TelescopePromptNormal guibg=NONE guifg=#abb2bf
                highlight TelescopePromptTitle guibg=NONE guifg=#61afef
                highlight TelescopePreviewTitle guibg=NONE guifg=#61afef
                highlight TelescopeResultsTitle guibg=NONE guifg=#61afef
                highlight TelescopePreviewNormal guibg=NONE guifg=#abb2bf
                highlight TelescopePreviewBorder guibg=NONE guifg=#5c6370
                highlight TelescopeResultsNormal guibg=NONE guifg=#abb2bf
                highlight TelescopeResultsBorder guibg=NONE guifg=#5c6370
                highlight TelescopeSelection guibg=#3e4451 guifg=#abb2bf
            ]])
            telescope.load_extension("media_files")
            telescope.load_extension("fzf")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "nvim-telescope/telescope-media-files.nvim",
        config = function()
            require("telescope").load_extension("media_files")
        end,
    },
}
