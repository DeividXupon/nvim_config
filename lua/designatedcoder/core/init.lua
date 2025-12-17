require("designatedcoder.core.options")
require("designatedcoder.keymaps")

vim.g.dbs = {
    b8safe = vim.env.DB_URL_B8SAFE,
    b8especialist = vim.env.DB_URL_ESPECIALIST,
    bbcdev = vim.env.DB_URL_BBCDEV,
    railways = vim.env.DB_URL_RAILWAY,
}

vim.opt.fillchars:append({ eob = "~" })

vim.filetype.add({
    extension = {
        ["http"] = "http",
    },
})

vim.wo.relativenumber = true

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99 -- abre tudo por padrão
vim.o.foldenable = true
-- vim.o.foldcolumn = "1" -- mostra a coluna de fold

-- vim.o.background = "dark"

vim.o.swapfile = false
vim.wo.number = true                                  -- Exibir números de linha (padrão: false)
vim.o.relativenumber = true                           -- Exibir números de linha relativos (padrão: false)
vim.o.clipboard = "unnamedplus"                       -- Sincronizar a área de transferência entre o SO e o Neovim (padrão: '')
vim.o.wrap = false                                    -- Exibir linhas como uma única linha longa (padrão: true)
vim.o.linebreak = true                                -- Complemento para wrap, não dividir palavras no meio (padrão: false)
vim.o.mouse = "a"                                     -- Ativar modo mouse (padrão: '')
vim.o.autoindent = true                               -- Copiar indentação da linha atual ao iniciar uma nova (padrão: true)
vim.o.ignorecase = true                               -- Buscar sem diferenciar maiúsculas/minúsculas, a menos que \C ou letras maiúsculas sejam usadas (padrão: false)
vim.o.smartcase = true                                -- Busca inteligente considerando maiúsculas se usadas (padrão: false)
vim.o.shiftwidth = 4                                  -- Número de espaços inseridos por indentação (padrão: 8)
vim.o.tabstop = 4                                     -- Número de espaços para cada tabulação (padrão: 8)
vim.o.softtabstop = 4                                 -- Número de espaços que um tab representa ao editar (padrão: 0)
vim.o.expandtab = true                                -- Converter tabs em espaços (padrão: false)
vim.o.scrolloff = 4                                   -- Linhas mínimas acima/abaixo do cursor (padrão: 0)
vim.o.sidescrolloff = 8                               -- Colunas mínimas ao lado do cursor quando wrap está desativado (padrão: 0)
vim.o.cursorline = true                               -- Destacar a linha atual (padrão: false)
vim.o.splitbelow = true                               -- Divisões horizontais sempre abaixo da janela atual (padrão: false)
vim.o.splitright = true                               -- Divisões verticais sempre à direita da janela atual (padrão: false)
vim.o.hlsearch = false                                -- Destacar resultados de busca (padrão: true)
vim.o.showmode = false                                -- Ocultar o modo atual (ex: -- INSERT --) (padrão: true)
vim.o.whichwrap = "bs<>[]hl"                          -- Permitir que teclas horizontais passem para a linha anterior/seguinte (padrão: 'b,s')
vim.o.numberwidth = 4                                 -- Largura da coluna de números (padrão: 4)
vim.o.swapfile = false                                -- Criar arquivo de troca (swap) (padrão: true)
vim.o.smartindent = true                              -- Indentação inteligente (padrão: false)
vim.o.showtabline = 2                                 -- Sempre mostrar a barra de abas (padrão: 1)
vim.o.backspace = "indent,eol,start"                  -- Permitir uso da tecla backspace em várias situações (padrão: 'indent,eol,start')
vim.o.pumheight = 10                                  -- Altura do menu de sugestões (padrão: 0)
vim.o.conceallevel = 0                                -- Mostrar `` em arquivos markdown (padrão: 1)
vim.wo.signcolumn = "yes"                             -- Sempre mostrar a coluna de sinais (padrão: 'auto')
vim.o.fileencoding = "utf-8"                          -- Codificação dos arquivos salvos (padrão: 'utf-8')
vim.o.cmdheight = 1                                   -- Altura da linha de comando do Neovim (padrão: 1)
vim.o.breakindent = true                              -- Manter indentação em quebras de linha (padrão: false)
vim.o.updatetime = 100                                -- Reduzir o tempo de atualização (padrão: 4000)
vim.o.backup = false                                  -- Criar arquivos de backup (padrão: false)
vim.o.writebackup = false                             -- Não permitir editar arquivos abertos por outro programa (padrão: true)
vim.o.undofile = true                                 -- Salvar histórico de desfazer (padrão: false)
vim.o.completeopt = "menuone,noselect"                -- Melhorar a experiência de autocompletar (padrão: 'menu,preview')
vim.opt.shortmess:append("c")                         -- Não mostrar mensagens do menu de autocompletar (padrão: não inclui 'c')
vim.opt.iskeyword:append("-")                         -- Considerar palavras com hífen como uma única palavra na busca (padrão: não inclui '-')
vim.opt.formatoptions:remove({ "c", "r", "o" })       -- Não inserir automaticamente prefixo de comentário em novas linhas (padrão: 'croql')
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Separar plugins do Vim e do Neovim caso o Vim ainda esteja instalado (padrão: inclui este caminho se o Vim estiver instalado)

vim.opt.fixendofline = false

vim.opt.number = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 25
vim.opt.sidescrolloff = 25

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

if vim.g.neovide then
    vim.o.guifont = "Hack Nerd Font:h8.0"
    vim.keymap.set("n", "<D-s>", ":w<CR>")      -- Save
    vim.keymap.set("v", "<D-c>", '"+y')         -- Copy
    vim.keymap.set("n", "<D-v>", '"+P')         -- Paste normal mode
    vim.keymap.set("v", "<D-v>", '"+P')         -- Paste visual mode
    vim.keymap.set("c", "<D-v>", "<C-R>+")      -- Paste command mode
    vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

    vim.opt.linespace = 0;
    vim.g.neovide_cursor_animation_length = 0.02 -- valor em segundos (ajuste conforme desejado)
    vim.g.neovide_scroll_animation_length = 0.09 -- velocidade do scroll (em segundos)

    vim.keymap.set('n', '<F11>', function()
      vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end)

    vim.keymap.set('n', '<C-m>', function()
      vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1.0) - 0.1
    end)
    vim.keymap.set('n', '<C-n>', function()
      vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1.0) + 0.1
    end)
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

vim.api.nvim_set_keymap("", "<C-S-v>", '"+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })
