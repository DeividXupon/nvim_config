local function is_wsl()
    local output = vim.fn.systemlist("uname -r")
    return output[1] and output[1]:find("WSL") ~= nil
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },

    config = function(_, opts)
        local is_wsl = is_wsl()

        if not is_wsl then
            if opts.servers then
                for server, config in pairs(opts.servers) do
                    config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                    vim.lsp.config(server, config)
                    vim.lsp.enable(server)
                end
            end
        end
        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end

        local capabilities
        if not is_wsl then
            -- used to enable autocompletion (assign to every lsp server config)
            capabilities = require("blink.cmp").get_lsp_capabilities()
        else
            capabilities = cmp_nvim_lsp.default_capabilities()
        end

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
        -- configure html server
        vim.lsp.config('html', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "javascript", "typescriptreact", "blade" },
        })
        vim.lsp.enable('html')

        -- configure typescript server with plugin
        vim.lsp.config('ts_ls', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }, -- Restringe ao TS/JS
        })
        vim.lsp.enable('ts_ls')

        -- configure css server
        vim.lsp.config('cssls', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "css", "scss", "less" }, -- Restringe ao CSS/SCSS/Less
        })
        vim.lsp.enable('cssls')

        vim.lsp.config('phpactor', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "php" }, -- Restringe ao PHP
        })
        vim.lsp.enable('phpactor')

        vim.lsp.config('intelephense', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "php" }, -- Restringe ao PHP
        })
        vim.lsp.enable('intelephense')

        vim.lsp.config('jsonls', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "json", "jsonc" }, -- Restringe ao JSON
        })
        vim.lsp.enable('jsonls')

        vim.lsp.config('pylsp', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "python" }, -- Restringe ao Python
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            maxLineLength = 120,
                            ignore = { "E501" },
                        },
                    },
                },
            },
        })
        vim.lsp.enable('pylsp')

        vim.lsp.config('rust_analyzer', {
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { vim.fn.stdpath("data") .. "/mason/bin/rust-analyzer" },
            filetypes = { "rust" },
        })
        vim.lsp.enable('rust_analyzer')

        vim.lsp.config('dockerls', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "dockerfile" }, -- Restringe ao Dockerfile
        })
        vim.lsp.enable('dockerls')

        vim.lsp.config('tailwindcss', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "javascriptreact", "typescriptreact", "html", "css", "scss" }, -- React and common frontend files
        })
        vim.lsp.enable('tailwindcss')
        vim.lsp.config('yamlls', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "yaml", "yml" }, -- Restringe ao YAML
        })
        vim.lsp.enable('yamlls')

        vim.lsp.config('bashls', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "sh", "bash" }, -- Restringe ao Shell Script
        })
        vim.lsp.enable('bashls')
        -- configure lua server (with special settings)
        vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
        vim.lsp.enable('lua_ls')
    end,
}
