require("designatedcoder.core.options")
require("designatedcoder.keymaps")

vim.g.dbs = {
    b8safe = vim.env.DB_URL_B8SAFE,
    b8especialist = vim.env.DB_URL_ESPECIALIST,
    bbcdev = vim.env.DB_URL_BBCDEV,
}

vim.o.background = "dark"

vim.opt.number = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true
