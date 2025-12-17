return {
    {
        'navarasu/onedark.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('onedark').setup {
                transparent = true,
                style = 'darker',
            }
            require('onedark').load()
        end
    },
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 100,
        config = function()
            require("dracula").setup {
                transparent_bg = true,
            }
        end,
    },
}
