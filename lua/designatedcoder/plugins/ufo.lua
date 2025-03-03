return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
        provider_selector = function(_, _, _)
            return { "treesitter", "indent" }
        end,
    },
    keys = {
        { "zR", "<cmd>lua require('ufo').openAllFolds()<CR>", desc = "Abrir todos os folds" },
        { "zM", "<cmd>lua require('ufo').closeAllFolds()<CR>", desc = "Fechar todos os folds" },
        { "zr", "<cmd>lua require('ufo').openFoldsExceptKinds()<CR>", desc = "Abrir folds exceto certos tipos" },
        { "zm", "<cmd>lua require('ufo').closeFoldsWith()<CR>", desc = "Fechar folds" },
        { "za", "<cmd>lua vim.api.nvim_command('normal! za')<CR>", desc = "Alternar fold" },
    }
}
