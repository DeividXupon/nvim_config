return {
    "akinsho/toggleterm.nvim",
    version = "*",
    -- open horizontal terminal
    config = function()
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<cmd>:wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<cmd>:wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<cmd>:wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<cmd>:wincmd l<CR>]], opts)
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
        require("toggleterm").setup({
            size = 15,
        })
    end,

    vim.api.nvim_set_keymap("n", "<leader>th1", "<cmd>:ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true }),
    vim.api.nvim_set_keymap("n", "<leader>th2", "<cmd>:2ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true }),
    vim.api.nvim_set_keymap("n", "<leader>th3", "<cmd>:3ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true }),

    vim.api.nvim_set_keymap("n", "<leader>tv1", "<cmd>:4ToggleTerm direction=vertical<CR>", { noremap = true, silent = true }),
    vim.api.nvim_set_keymap("n", "<leader>tv2", "<cmd>:5ToggleTerm direction=vertical<CR>", { noremap = true, silent = true }),
    vim.api.nvim_set_keymap("n", "<leader>tv3", "<cmd>:6ToggleTerm direction=vertical<CR>", { noremap = true, silent = true }),

    vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>:7ToggleTerm direction=float<CR>", { noremap = true, silent = true }),
    vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>:8ToggleTerm direction=tab<CR>", { noremap = true, silent = true }),
}
