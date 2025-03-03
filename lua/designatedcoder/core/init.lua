require("designatedcoder.core.options")
require("designatedcoder.keymaps")

vim.g.dbs = {
    b8safe = vim.env.DB_URL_B8SAFE,
    b8especialist = vim.env.DB_URL_ESPECIALIST,
    bbcdev = vim.env.DB_URL_BBCDEV,
}

vim.opt.fillchars:append({ eob = " " })

vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})

vim.wo.relativenumber = true

vim.o.foldmethod = "syntax"
vim.o.foldenable = true
vim.o.foldlevel = 99

vim.o.background = "dark"

vim.o.swapfile = false

vim.opt.fixendofline = false

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


-- Apply the custom highlight group to the Snacks picker
vim.api.nvim_set_hl(0, 'SnacksPickerMatch', { fg = '#47db6d', bg = '' })
