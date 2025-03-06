return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod", lazy = true },
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    init = function()
        -- Configurações para o vim-dadbod-ui
        vim.g.db_ui_save_location = "~/.config/nvim/db_ui" -- Local para salvar queries
        vim.g.db_ui_use_nerd_fonts = 1 -- Usar Nerd Fonts para ícones
        vim.g.db_ui_auto_execute_table_helpers = 1 -- Executar automaticamente helpers de tabela

        -- Configurações de layout
        vim.g.db_ui_win_position = "right" -- Posição da janela (left, right, top, bottom)
        vim.g.db_ui_winwidth = 30 -- Largura da janela
        vim.g.db_ui_show_database_icon = 1 -- Mostrar ícone do banco de dados
        vim.g.db_ui_force_echo_notifications = 1 -- Forçar notificações de eco
    end,

    config = function()
    end,
}
