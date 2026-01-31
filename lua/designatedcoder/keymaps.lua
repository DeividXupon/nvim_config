vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>"); 

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", opts)

--resize
keymap.set("n", "<Up>", "<cmd>resize -4<CR>", opts)
keymap.set("n", "<Down>", "<cmd>resize +4<CR>", opts)
keymap.set("n", "<Left>", "<cmd>vertical resize -4<CR>", opts)
keymap.set("n", "<Right>", "<cmd>vertical resize +4<CR>", opts)

-- indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

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

-- Harpoon
keymap.set("n", "<leader>ha", function() require("harpoon"):list():add() end, { desc = "Add file to harpoon" })
keymap.set("n", "<leader>hm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Toggle harpoon menu" })
keymap.set("n", "<leader>h1", function() require("harpoon"):list():select(1) end, { desc = "Harpoon 1" })
keymap.set("n", "<leader>h2", function() require("harpoon"):list():select(2) end, { desc = "Harpoon 2" })
keymap.set("n", "<leader>h3", function() require("harpoon"):list():select(3) end, { desc = "Harpoon 3" })
keymap.set("n", "<leader>h4", function() require("harpoon"):list():select(4) end, { desc = "Harpoon 4" })
keymap.set("n", "<leader>h5", function() require("harpoon"):list():select(5) end, { desc = "Harpoon 5" })
keymap.set("n", "<leader>h6", function() require("harpoon"):list():select(6) end, { desc = "Harpoon 6" })
keymap.set("n", "<leader>h7", function() require("harpoon"):list():select(7) end, { desc = "Harpoon 7" })
keymap.set("n", "<leader>h8", function() require("harpoon"):list():select(8) end, { desc = "Harpoon 8" })
keymap.set("n", "<leader>h9", function() require("harpoon"):list():select(9) end, { desc = "Harpoon 9" })

vim.keymap.set('n', '<leader>-', function()
  vim.fn.system('kitty @ set-font-size -2')
end, { desc = 'Diminuir fonte do Kitty' })

vim.keymap.set('n', '<leader>+', function()
  vim.fn.system('kitty @ set-font-size +2')
end, { desc = 'Aumentar fonte do Kitty' })

vim.keymap.set({ "n", "v" }, "x", "x", { noremap = true, silent = true, desc = "Delete character (yank)" })
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true, desc = "Delete without yanking" })
