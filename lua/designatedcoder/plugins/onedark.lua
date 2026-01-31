return {
    {
        "navarasu/onedark.nvim",
        enabled = false,
        lazy = false, -- changed to lazy
        priority = 10000,
        config = function()
            require("onedark").setup({
                style = "darker",
            })
            require("onedark").load()
        end,
    },
}
