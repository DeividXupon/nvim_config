return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                            -- Only on MacOS or Linux
    opts = {
        window = {
            layout = "float",    -- 'vertical', 'horizontal', 'float', 'replace'
            width = 70,             -- width of the window
            relative = "editor",    -- 'editor', 'win', 'cursor', 'mouse'
            border = "double",      -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
            row = 8, -- row position of the window, default is centered
            col = (vim.o.columns - 70) - 5, -- column position of the window, default is centered
            title = "01 dos Chats de IA - (.-.)", -- title of chat window
            footer = nil,           -- footer of chat window
            zindex = 1,             -- determines if window is on top or below other floating windows
        },                          -- See Configuration section for options
    },
    keys = {
        { "<leader>cc", ":CopilotChatOpen<CR>",   desc = "Abrir chat do Copilot" },
        { "<leader>cr", ":CopilotChatReview<CR>", desc = "Abrir chat do Copilot para revisar codigo" },
        { "<leader>cp", function()
            require("CopilotChat").open({
                window = {
                    layout = "replace",
                },
            })
        end, desc = "Copilot Chat - Replace" }
    },
}
