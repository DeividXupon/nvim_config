return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "github/copilot.vim" },
    config = function()
        require("CopilotChat").setup()
    end,
    keys = {
        { "<leader>cc", ":CopilotChat<CR>", desc = "Abrir chat do Copilot" },
    }
}
