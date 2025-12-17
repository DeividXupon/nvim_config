return {
    {
        "karb94/neoscroll.nvim",
        opts = {
            mappings = {},
        },
        config = function()
            require("neoscroll").setup()

            local neoscroll = require("neoscroll")

            local keymaps = {
                ["<C-b>"] = function()
                    neoscroll.scroll(-0.55, { move_cursor = true, duration = 50 })
                end,
                ["<C-d>"] = function()
                    neoscroll.scroll(0.55, { move_cursor = true, duration = 50 })
                end,
            }
            local modes = { "n", "v", "x" }
            for key, func in pairs(keymaps) do
                vim.keymap.set(modes, key, func)
            end
        end,
    },
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
        config = function()
            vim.o.winheight = 35
            vim.o.winminheight = 0
            vim.o.equalalways = true

            require("windows").setup({
                animation = {
                    enable = true,
                    duration = 150,
                    fps = 120,
                },
                autowidth = {
                    enable = true,
                    winwidth = 65,
                    filetype = {"NvimTree", "neo-tree", "undotree"},
                },
                ignore = {
                    buftype = {
                        "terminal",
                        "quickfix",
                    },
                },

            })
        end,
    },
}
