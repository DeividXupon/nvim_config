return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
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
                        theme = "ivy",
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
                highlight TelescopeNormal guifg=#2C3035
                highlight TelescopePromptBorder guifg=#18181a guibg=#18181a
                highlight TelescopePromptNormal guifg=#D3486F
                highlight TelescopePromptTitle guifg=#D3486F guibg=#222222
                highlight TelescopePreviewTitle guifg=#D3486F guibg=#222222
                highlight TelescopeResultsTitle guifg=#D3486F guibg=#222222
                highlight TelescopePreviewNormal guibg=#242526
                highlight TelescopePreviewBorder guifg=#18181a guibg=#18181a
                highlight TelescopeResultsNormal guibg=#2c2d30
                highlight TelescopeResultsBorder guifg=#18181a guibg=#18181a
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
