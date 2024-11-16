vim.g.lazyvim_php_lsp = "intelephense"

vim.cmd([[
  let g:coc_user_config = {
  \   'coc.preferences.autoImportSuggestions': v:true,
  \   'coc.preferences.includeCompletionItems': ['@include', '@extends', '@component'],
  \   'coc.preferences.snippetSuggestions': 'enable'
  \ }
]])

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})
