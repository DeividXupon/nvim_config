return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                "*", -- Ativar para todos os arquivos
                css = { rgb_fn = true }, -- Ativar funções rgb() em arquivos CSS
                html = { names = false }, -- Desativar nomes de cores em arquivos HTML
                lua = { names = true }, -- Ativar nomes de cores em arquivos Lua
                javascript = { names = true }, -- Ativar nomes de cores em arquivos JavaScript
            }, {
                mode = 'background', -- Modo de exibição das cores (foreground, background, virtualtext)
                names = false, -- Desativar nomes de cores globais
            })
        end,
    },
    {
        "uga-rosa/ccc.nvim",
        config = function()
            require("ccc").setup({
                -- Adicione aqui as configurações desejadas para o ccc.nvim
            })
            -- Mapeamento de tecla para ativar o ccc.nvim
            vim.api.nvim_set_keymap('n', '<leader>cp', '<cmd>CccPick<cr>', { noremap = true, silent = true })
        end,
    }
}
