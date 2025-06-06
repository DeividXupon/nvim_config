return {
    "narutoxy/silicon.lua",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
        require("silicon").setup({
            output = "/home/deivid/Pictures/SILICON_$year-$month-$date-$time.png",
        })
        vim.keymap.set("v", "<leader>sp", function()
            require("silicon").visualise_cmdline({
                to_clip = true,
            })
        end, { noremap = true, silent = true, desc = "Export code selection as image (Silicon)" })
        vim.keymap.set("v", "<leader>bp", function()
            require("silicon").visualise_cmdline({
                to_clip = true,
                show_buf = true,
            })
        end, { noremap = true, silent = true, desc = "Export code buffer as image (Silicon)" })
    end,
}
