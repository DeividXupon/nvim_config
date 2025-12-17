return {
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup({
                show = true,
                set_highlights = true,
                handle = {
                    color = "#6b6b6b",
                },
                marks = {
                    Search = { color = "#ff9e64" },
                    Error = { color = "#db4b4b" },
                    Warn = { color = "#e0af68" },
                    Info = { color = "#0db9d7" },
                    Hint = { color = "#10B981" },
                    Misc = { color = "#9d7cd8" },
                },
            })
        end,
    },
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            -- require('hlslens').setup() is not required
            require("scrollbar.handlers.search").setup({
                -- hlslens config overrides
            })
        end,
    },
}
