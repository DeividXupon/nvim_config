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
        'KabbAmine/vCoolor.vim',
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>cp', '<cmd>VCoolor<cr>', { noremap = true, silent = true })
        end,
    }
}
