return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({
            "*", -- Ativar para todos os arquivos
            css = { rgb_fn = true }, -- Ativar funções rgb() em arquivos CSS
            html = { names = false }, -- Desativar nomes de cores em arquivos HTML
        })
    end,
}
