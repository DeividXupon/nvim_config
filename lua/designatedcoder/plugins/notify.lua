return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")

        notify.setup({
            background_colour = "#000000", -- Fundo preto
            stages = "slide",              -- Faz a notificação vir da direita
            timeout = 3000,                -- Tempo antes de desaparecer (3s)
            max_width = 50,                -- Largura máxima da notificação
            render = "default",            -- Estilo de renderização
        })

        -- Definir `nvim-notify` como o notificador padrão
        vim.notify = notify
    end,
}
