return {
    "simeji/winresizer",
    config = function()
        -- Iniciar o modo de redimensionamento
        vim.api.nvim_set_keymap('n', '<C-w>r', ':WinResizerStartResize<CR>', { noremap = true, silent = true })
    end,
}
