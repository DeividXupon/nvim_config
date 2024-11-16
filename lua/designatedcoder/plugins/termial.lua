return {
    "akinsho/toggleterm.nvim",
    version = "*",
    -- open horizontal terminal
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.33
                end
            end,
        })
        local Terminal = require("toggleterm.terminal").Terminal

        --olama
        local ollamaBot = Terminal:new({
            dir = "~/",
            direction = "vertical",
            name = "OllamaBot",
            hidden = false,
            close_on_exit = false,
        })
        function _ati_xbot()
            ollamaBot:toggle()
        end
        vim.api.nvim_set_keymap("n", "<leader>xb", "<cmd>lua _ati_xbot()<CR>ati_xbot<CR>", { desc = "Open Bot Ollama" })

        --lazygit
        local lazygit = Terminal:new({
            cmd = "lazygit",
            direction = "float",
            float_opts = { border = "curved", title_pos = "center" },
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
        })
        function _ati_lazygit()
            lazygit:toggle()
        end
        vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _ati_lazygit()<CR>", { desc = "Open Lazygit" })

        --basic
        local basic = Terminal:new({
            cmd = "bash",
            direction = "horizontal",
            float_opts = { border = "curved", title_pos = "center" },
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
        })
        function _ati_basic()
            basic:toggle()
        end
        vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua _ati_basic()<CR>", { desc = "Open Basic Terminal" })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
}
