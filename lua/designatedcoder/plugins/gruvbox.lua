return {
    {
        "morhetz/gruvbox",
        lazy = false,
        priority = 10000,
        config = function()
            local function set_transparent_background()
                vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
            end

            vim.o.background = "dark"
            vim.g.gruvbox_contrast_dark = "hard"
            local group = vim.api.nvim_create_augroup("DesignatedCoderGruvbox", { clear = true })
            vim.api.nvim_create_autocmd("ColorScheme", {
                group = group,
                pattern = "gruvbox",
                callback = set_transparent_background,
            })

            vim.cmd.colorscheme("gruvbox")
            set_transparent_background()
        end,
    },
}
