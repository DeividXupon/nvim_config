return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        input = { enabled = true },
        indent = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 5000,
        },
        terminal = {
            enabled = true,
        },
        picker = { enabled = true, hidden = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
            notification = {
                -- wo = { wrap = true } -- Wrap notifications
            },
            terminal = {
                border = "rounded",
                position = "bottom",
                height = 0.3,
            },
            picker = {
                border = "rounded",
                position = "bottom",
                height = 0.4,
            },
            telescope = {
                borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
            },
        },
    },
    keys = function()
        local themes = require('telescope.themes')
        local picker_opts = themes.get_dropdown()

        return {
            -- Top Pickers & Explorer
            {
                "<C-p>",
                function()
                    Snacks.picker.smart()
                end,
                desc = "Smart Find Files",
            },
            {
                "<leader>fg",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Grep",
            },
            {
                "<leader>hc",
                function()
                    Snacks.picker.command_history()
                end,
                desc = "Command History",
            },
            {
                "<leader>hn",
                function()
                    Snacks.picker.notifications()
                end,
                desc = "Notification History",
            },
            -- find
            {
                "<leader>fb",
                function()
                    Snacks.picker.buffers()
                end,
                desc = "Buffers",
            },
            {
                "<leader>fr",
                function()
                    Snacks.picker.recent()
                end,
                desc = "Recent",
            },
            -- git
            {
                "<leader>gb",
                function()
                    Snacks.picker.git_branches()
                end,
                desc = "Git Branches",
            },
            {
                "<leader>gs",
                function()
                    Snacks.picker.git_status()
                end,
                desc = "Git Status",
            },
            -- Grep
            {
                "<leader>fw",
                function()
                    Snacks.picker.grep_word()
                end,
                desc = "Visual selection or word",
                mode = { "n", "x" },
            },
            -- search
            {
                "<leader>sd",
                function()
                    Snacks.picker.diagnostics()
                end,
                desc = "Diagnostics",
            },
            {
                "<leader>si",
                function()
                    Snacks.picker.icons()
                end,
                desc = "Icons",
            },
            {
                "<leader>uC",
                function()
                    Snacks.picker.colorschemes()
                end,
                desc = "Colorschemes",
            },
            -- Other
            {
                "<leader>zz",
                function()
                    Snacks.zen()
                end,
                desc = "Toggle Zen Mode",
            },
            {
                "<leader>zo",
                function()
                    Snacks.zen.zoom()
                end,
                desc = "Toggle Zen Zoom",
            },
            {
                "<leader>ze",
                function()
                    Snacks.zen.zoom()
                end,
                desc = "Toggle Zen Zen",
            },
            {
                "<leader>gB",
                function()
                    Snacks.gitbrowse()
                end,
                desc = "Git Browse",
                mode = { "n", "v" },
            },
            {
                "<leader>gg",
                function()
                    Snacks.lazygit()
                end,
                desc = "Lazygit",
            },
            {
                "<C-t>",
                function()
                    Snacks.terminal.toggle()
                end,
                desc = "Open Terminal",
            },
            {
                "]]",
                function()
                    Snacks.words.jump(vim.v.count1)
                end,
                desc = "Next Reference",
                mode = { "n", "t" },
            },
            {
                "[[",
                function()
                    Snacks.words.jump(-vim.v.count1)
                end,
                desc = "Prev Reference",
                mode = { "n", "t" },
            },
        }
    end,
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd

                -- Create some toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
