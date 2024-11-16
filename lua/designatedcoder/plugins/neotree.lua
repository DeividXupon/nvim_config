return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim",              -- Optional image support in preview window: See # Preview Mode for more information
        },
        config = function()
            vim.g.leaded_newtrw = 1
            vim.g.loaded_newtrPlugin = 1


            require("nvim-tree").setup({
                view = {
                    width = 35,
                    relativenumber = true,
                },
                renderer = {
                    icons = {
                        glyphs = {
                            default = "",
                            symlink = "",
                            folder = {
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                            },
                            git = {
                                unstaged = "✹",
                                staged = "✓",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "★",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                    indent_markers = {
                        enable = true,
                        icons = {
                            corner = "└",
                            edge = "│",
                            item = "├",
                            bottom = "─",
                            none = " ",
                        },
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                        window_picker = {
                            enable = false,
                        },
                    },
                },
                filters = {
                    dotfiles = false, -- Corrigido para `dotfiles`
                    custom = { ".DS_Store", "node_modules" },
                },
                git = {
                    ignore = false,
                },
            })
        end,
        vim.keymap.set('n', '<leader>et', '<cmd>NvimTreeToggle<CR>', { desc = "Toggle file explore" }),
        vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = "Refresh file explorer" }),
        vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeRefresh<CR>', { desc = "Collapse file explore" })
    }
}
