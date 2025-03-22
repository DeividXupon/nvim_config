return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                            -- Only on MacOS or Linux
    opts = {
        window = {
            layout = "vertical",    -- 'vertical', 'horizontal', 'float', 'replace'
            width = 50,             -- width of the window
            relative = "editor",    -- 'editor', 'win', 'cursor', 'mouse'
            border = "single",      -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
            row = nil,              -- row position of the window, default is centered
            col = nil,              -- column position of the window, default is centered
            title = "Copilot Chat", -- title of chat window
            footer = nil,           -- footer of chat window
            zindex = 1,             -- determines if window is on top or below other floating windows
        },                          -- See Configuration section for options
    },
    keys = {
        { "<leader>cc", ":CopilotChatOpen<CR>",   desc = "Abrir chat do Copilot" },
        { "<leader>cr", ":CopilotChatReview<CR>", desc = "Abrir chat do Copilot para revisar codigo" },
    },
}
