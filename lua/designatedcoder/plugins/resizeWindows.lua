return {
    "simeji/winresizer",
    config = function()
        vim.api.nvim_set_keymap('n', 'sr', ':WinResizerStartResize<CR>', { noremap = true, silent = true, desc='Start resize mode' })
    end,
}
