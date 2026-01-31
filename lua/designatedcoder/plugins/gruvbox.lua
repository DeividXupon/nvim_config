return {
    {
        "morhetz/gruvbox",
        lazy = false,
        priority = 10000,
        config = function()
            vim.o.background = "dark"
            vim.g.gruvbox_contrast_dark = "hard"
            vim.cmd.colorscheme("gruvbox")

            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "gruvbox",
                callback = set_black_background,
            })
        end,
    },
}
