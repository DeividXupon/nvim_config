vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

local function set_dbui_colorscheme()
    vim.cmd("colorscheme default")
end
vim.keymap.set("n", "tb", function()
    vim.cmd("DBUI")
    set_dbui_colorscheme()
end, { noremap = true, silent = true })

keymap.set("i", "jk", "<ESC>", { desc = "close insert mode to normal mode" })
keymap.set("t", "jk", "<ESC>", { desc = "close insert mode to normal mode" })

-- Copiar com Ctrl + C no modo visual
keymap.set("v", "<C-c>", '"+y', { desc = "Copiar para o clipboard do sistema" })

-- Colar com Ctrl + V no modo normal e modo de inserção
keymap.set("n", "<C-v>", '"+p', { desc = "Colar do clipboard do sistema" })

keymap.set("i", "<C-v>", "<C-r>+", { desc = "Colar do clipboard do sistema" })

keymap.set("i", "<C-s>", "<cmd>:w<CR>", { desc = "Salvar" })
keymap.set("n", "<C-s>", "<cmd>:w<CR>", { desc = "Salvar" })
keymap.set("v", "<C-s>", "<cmd>:w<CR>", { desc = "Salvar" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontallly" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Close curret split" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current splizt" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = " Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set("n", "dw", '"_dw', { noremap = true, silent = true })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true })
vim.keymap.set("x", "d", '"_d', { noremap = true, silent = true }) -- Para modo visual

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "dx", '"+d', { noremap = true, silent = true }) -- dx para deletar e copiar para a área de transferência
vim.keymap.set("x", "<C-x>", '"+d', { noremap = true, silent = true }) -- Ctrl+X para deletar e copiar para a área de transferência

vim.api.nvim_set_keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>bc", ":bdelete<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
    "n",
    "<leader>tw",
    "<cmd>lua require('kulala').run()<cr>",
    { noremap = true, silent = true, desc = "Execute the request" }
)
