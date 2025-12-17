return {
  "RRethy/vim-illuminate",
  config = function()
    -- Personalize highlight group
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

    -- Configure illuminate
     require("illuminate").configure({
       providers = {
         "lsp",
         "treesitter",
         "regex",
       },
       delay = 100,
       filetypes_denylist = {
         "NvimTree",
         "TelescopePrompt",
         "dashboard",
       },
       modes_denylist = { 'v' },
       under_cursor = true,
       large_file_cutoff = 2000,
       large_file_overrides = {
         providers = { "regex" },
       },
     })
  end,
}
