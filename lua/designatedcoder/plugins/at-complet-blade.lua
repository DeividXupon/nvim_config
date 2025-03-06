return {
    {
        "neoclide/coc.nvim",
        ft = { "blade" },
        branch = "release",
        config = function()
            -- Configure o coc.nvim aqui, se necessário
            -- Por exemplo, se você quiser configurar o vim para o Blade
            vim.cmd([[ let g:coc_global_extensions = ['coc-blade'] ]])
            -- Configurar o botão de confirmação para C-Space
            vim.cmd([[
                inoremap <silent><expr> <C-h> coc#pum#confirm()
                inoremap <silent><expr> <C-j> coc#pum#next(1)
                inoremap <silent><expr> <C-k> coc#pum#prev(1)
            ]])
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
