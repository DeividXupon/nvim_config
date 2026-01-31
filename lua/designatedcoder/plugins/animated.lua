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
}
