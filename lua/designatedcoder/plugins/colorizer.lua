return {
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },
    {
        'KabbAmine/vCoolor.vim',
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>cp', '<cmd>VCoolor<cr>', { noremap = true, silent = true })
        end,
    }
}
