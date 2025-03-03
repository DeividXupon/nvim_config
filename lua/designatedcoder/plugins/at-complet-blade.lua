return {
    -- {
    --     "jwalton512/vim-blade",
    --     ft = { "blade", "php" }, -- Faz com que ele seja carregado apenas quando você abrir um arquivo .blade.php
    -- },
    -- Instalando o coc.nvim
    {
        "neoclide/coc.nvim",
        ft = { "blade" },
        branch = "release",
        config = function()
            -- Configure o coc.nvim aqui, se necessário
            -- Por exemplo, se você quiser configurar o vim para o Blade
            vim.cmd([[ let g:coc_global_extensions = ['coc-blade'] ]])
        end,
    },
    -- Instalando o coc-blade
    {
        "yaegassy/coc-blade",
        ft = { "blade" },
        after = "coc.nvim", -- Garante que o coc.nvim seja carregado antes
        config = function()
            -- Pode adicionar configurações adicionais específicas do coc-blade, se necessário
        end,
    },
}
