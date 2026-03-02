return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "KabbAmine/vCoolor.vim",
    },
    {
        "eero-lehtinen/oklch-color-picker.nvim",
        event = "VeryLazy",
        version = "*",
        cmd = "ColorPickOklch",
        keys = {
            {
                "<leader>v",
                "<cmd>ColorPickOklch<cr>",
                desc = "Color pick under cursor",
            },
        },
        opts = {},
    },
}
