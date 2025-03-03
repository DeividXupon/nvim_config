local trigger_text = ";"

return {
    "saghen/blink.cmp",
    enabled = true,
    -- In case there are breaking changes and you want to go back to the last
    -- working release
    -- https://github.com/Saghen/blink.cmp/releases
    -- version = "v0.9.3",
    dependencies = {
        "moyiz/blink-emoji.nvim",
        "giuxtaposition/blink-cmp-copilot",
        "Kaiser-Yang/blink-cmp-dictionary",
    },
    opts = function(_, opts)
        -- I noticed that telescope was extremeley slow and taking too long to open,
        -- assumed related to blink, so disabled blink and in fact it was related
        -- :lua print(vim.bo[0].filetype)
        -- So I'm disabling blink.cmp for Telescope
        opts.enabled = function()
            -- Get the current buffer's filetype
            local filetype = vim.bo[0].filetype
            -- Disable for Telescope buffers
            if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
                return false
            end
            return true
        end

        -- NOTE: The new way to enable LuaSnip
        -- Merge custom sources with the existing ones from lazyvim
        -- NOTE: by default lazyvim already includes the lazydev source, so not adding it here again
        opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
            default = { "lsp", "path", "buffer", "dadbod", "dictionary" },
            providers = {
                lsp = {
                    name = "lsp",
                    enabled = true,
                    module = "blink.cmp.sources.lsp",
                    score_offset = 90, -- the higher the number, the higher the priority
                },
                path = {
                    name = "Path",
                    module = "blink.cmp.sources.path",
                    score_offset = 25,
                    fallbacks = { "snippets", "buffer" },
                    opts = {
                        trailing_slash = false,
                        label_trailing_slash = true,
                        get_cwd = function(context)
                            return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
                        end,
                        show_hidden_files_by_default = true,
                    },
                },
                buffer = {
                    name = "Buffer",
                    enabled = true,
                    max_items = 3,
                    module = "blink.cmp.sources.buffer",
                    min_keyword_length = 4,
                    score_offset = 15, -- the higher the number, the higher the priority
                },
                -- Example on how to configure dadbod found in the main repo
                -- https://github.com/kristijanhusak/vim-dadbod-completion
                dadbod = {
                    name = "Dadbod",
                    module = "vim_dadbod_completion.blink",
                    score_offset = 85, -- the higher the number, the higher the priority
                },
                -- https://github.com/Kaiser-Yang/blink-cmp-dictionary
                -- In macOS to get started with a dictionary:
                -- cp /usr/share/dict/words ~/github/dotfiles-latest/dictionaries/words.txt
                --
                -- NOTE: For the word definitions make sure "wn" is installed
                -- brew install wordnet
                dictionary = {
                    module = "blink-cmp-dictionary",
                    name = "Dict",
                    score_offset = 20, -- the higher the number, the higher the priority
                    -- https://github.com/Kaiser-Yang/blink-cmp-dictionary/issues/2
                    enabled = true,
                    max_items = 8,
                    min_keyword_length = 3,
                    opts = {
                        dictionary_directories = { vim.fn.expand("~/github/dotfiles-latest/dictionaries") },
                        -- Notice I'm also adding the words I add to the spell dictionary
                        dictionary_files = {
                            vim.fn.expand("~/github/dotfiles-latest/neovim/neobean/spell/en.utf-8.add"),
                            vim.fn.expand("~/github/dotfiles-latest/neovim/neobean/spell/es.utf-8.add"),
                        },
                    },
                },
            },
        })

        opts.cmdline = {
            -- command line completion, thanks to dpetka2001 in reddit
            -- https://www.reddit.com/r/neovim/comments/1hjjf21/comment/m37fe4d/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
            sources = function()
                local type = vim.fn.getcmdtype()
                if type == "/" or type == "?" then
                    return { "buffer" }
                end
                if type == ":" then
                    return { "cmdline" }
                end
                return {}
            end,
        }

        opts.completion = {
            documentation = {
                auto_show = true,
                window = {
                    border = "single",
                },
            },
        }

        -- The default preset used by lazyvim accepts completions with enter
        -- I don't like using enter because if on markdown and typing
        -- something, but you want to go to the line below, if you press enter,
        -- the completion will be accepted
        -- https://cmp.saghen.dev/configuration/keymap.html#default
        opts.keymap = {
            ["<C-e>"] = { "hide" },
            ["<C-y>"] = { "select_and_accept" },
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "scroll_documentation_up", "fallback" },
            ["<C-n>"] = { "scroll_documentation_down", "fallback" },
            ["<C-Tab>"] = { "snippet_forward", "fallback" },
        }

        opts.signature = {
            enabled = true,
        }

        return opts
    end,
}
