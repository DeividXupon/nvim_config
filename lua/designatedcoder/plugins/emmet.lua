return {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "typescript", "blade", "php" },
    config = function()
        vim.g.user_emmet_mode = 'a'
        vim.g.user_emmet_leader_key = '<C-Z>'
    end
}