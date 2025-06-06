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
                    neoscroll.scroll(-0.53, { move_cursor = true, duration = 50 })
                end,
                ["<C-f>"] = function()
                    neoscroll.scroll(0.13, { move_cursor = true, duration = 50})
                end,
                ["<C-n>"] = function()
                    neoscroll.scroll(-0.53, { move_cursor = true, duration = 50 })
                end,
                ["<C-d>"] = function()
                    neoscroll.scroll(0.53, { move_cursor = true, duration = 50 })
                end,
                ["zt"] = function()
                    neoscroll.zt({ half_win_duration = 250 })
                end,
                ["zz"] = function()
                    neoscroll.zz({ half_win_duration = 250 })
                end,
                ["zb"] = function()
                    neoscroll.zb({ half_win_duration = 250 })
                end,
            }
            local modes = { "n", "v", "x" }
            for key, func in pairs(keymaps) do
                vim.keymap.set(modes, key, func)
            end
        end,
    },
}
