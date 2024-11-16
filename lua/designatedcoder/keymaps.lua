vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "close insert mode to normal mode" })

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

-- fechar todos os terminais
