return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local colors = {
                blue = "#80a0ff",
                cyan = "#79dac8",
                black = "#080808",
                white = "#c6c6c6",
                red = "#ff5189",
                violet = "#d183e8",
                grey = "#474747",
            }
            local bubbles_theme = {
                normal = {
                    a = { fg = colors.black, bg = colors.violet },
                    b = { fg = colors.white, bg = colors.grey },
                    c = { fg = colors.white },
                },

                insert = { a = { fg = colors.black, bg = colors.blue } },
                visual = { a = { fg = colors.black, bg = colors.cyan } },
                replace = { a = { fg = colors.black, bg = colors.red } },

                inactive = {
                    a = { fg = colors.white, bg = colors.black },
                    b = { fg = colors.white, bg = colors.black },
                    c = { fg = colors.white },
                },
            }
            require("lualine").setup({
                options = {
                    theme = bubbles_theme,
                    icons_enabled = true,
                    component_separators = { left = "|", right = "|" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    },
                },
                sections = {
                    lualine_a = {
                        function()
                            local mode_map = {
                                ["n"] = "(u_u)",
                                ["i"] = "(҂◡̀_◡́)ᕤ",
                                ["v"] = "(⌐■_■)",
                                ["V"] = "ヽ(⌐■_■)ノ",
                                ["c"] = "(._. )",
                                ["R"] = "(x_x)",
                                ["t"] = "ლ(ಠ益ಠლ)",
                            }
                            local mode = vim.fn.mode()
                            return mode_map[mode] or mode
                        end,
                    },
                    lualine_b = { "filename" },
                    lualine_c = { "branch", "diff", "diagnostics" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })
        end,
    },
}
