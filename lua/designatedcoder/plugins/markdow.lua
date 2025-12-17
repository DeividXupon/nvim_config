return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    opts = {},
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "markdown", "copilot-chat" },
            callback = function()
                require("render-markdown").setup()
            end,
        })
    end,
}
