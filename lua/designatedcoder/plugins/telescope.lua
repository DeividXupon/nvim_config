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
                            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                            ["<C-j>"] = actions.move_selection_next, -- move to next result
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
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
