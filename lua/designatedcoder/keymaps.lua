vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

local function set_dbui_colorscheme()
    require("onedark").setup({
        style = "deep",
    })
    require("onedark").load()
end
vim.keymap.set("n", "tb", function()
    vim.cmd("DBUI")
    set_dbui_colorscheme()
end, { noremap = true, silent = true, desc = "Open DBUI" })

keymap.set("i", "jk", "<ESC>", { desc = "close insert mode to normal mode" })
keymap.set("t", "jk", "<ESC>", { desc = "close insert mode to normal mode" })

keymap.set("i", "<C-s>", "<cmd>:w<CR>", { desc = "Salvar" })
keymap.set("n", "<C-s>", "<cmd>:w<CR>", { desc = "Salvar" })
keymap.set("v", "<C-s>", "<cmd>:w<CR>", { desc = "Salvar" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>hn", "<cmd>:Notifications<CR>", { desc = "Histórioco de Notifications" })

vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true, desc = "Delete line" })
vim.keymap.set("n", "dw", '"_dw', { noremap = true, silent = true, desc = "Delete word" })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true, desc = "Delete to end of line" })

-- Bufferline
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = " Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

vim.api.nvim_set_keymap(
    "n",
    "<leader>1",
    ":BufferLineGoToBuffer 1<CR>",
    { noremap = true, silent = true, desc = "Tab 1" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>2",
    ":BufferLineGoToBuffer 2<CR>",
    { noremap = true, silent = true, desc = "Tab 2" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>3",
    ":BufferLineGoToBuffer 3<CR>",
    { noremap = true, silent = true, desc = "Tab 3" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>4",
    ":BufferLineGoToBuffer 4<CR>",
    { noremap = true, silent = true, desc = "Tab 4" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>5",
    ":BufferLineGoToBuffer 5<CR>",
    { noremap = true, silent = true, desc = "Tab 5" }
)

-- windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontallly" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Close curret split" })
keymap.set("n", "<leader>so", "<C-w>o", { desc = "Close other splits" })
keymap.set("n", "<leader>sn", "<C-w>r", { desc = "Resize split" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current splizt" })

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true, desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
------- hitoricos
keymap.set("n", "<leader>hn", "<cmd>Telescope notify<CR>", { desc = "Histórico de notificações" })
keymap.set("n", "<leader>hf", "<cmd>Telescope oldfiles<CR>", { desc = "Arquivos recentes" })
------- git
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
------- search
keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<CR>", { desc = "Colorschemes" })
------- config toggle
keymap.set("n", "<leader>uw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })
