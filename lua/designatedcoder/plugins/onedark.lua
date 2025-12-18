return {
    {
        'navarasu/onedark.nvim',
        lazy = true,  -- changed to lazy
        priority = 100,
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
        lazy = true,  -- changed to lazy
        priority = 100,
        config = function()
            require("dracula").setup {
                transparent_bg = true,
            }
        end,
    },
}
