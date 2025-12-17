return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
        window = (function()
            local width = math.max(math.floor(vim.o.columns * 0.18), 30)
            local height = math.max(math.floor(vim.o.lines * 0.3), 10)
            local col = vim.o.columns - width - 2

            return {
                layout = "float",
                width = width,
                height = height,
                relative = "editor",
                border = "rounded",
                row = 1,
                col = col,
                title = "Copilot Chat",
                zindex = 50,
            }
        end)(),
        prompts = {
            daily = {
                prompt = "Ajuste minha daily de dev",
                system_prompt =
                [[Voce deve ajustar essa minha daily de dev. essa daily tera a estrutura que ja esta feita:
                        Não é obrigatório ter todos eu vou te passar um texto unico e você deve separar e organizar as informações na estrutura acima,
                        caso não tenha alguma seção, apenas ignore.

                        Explicação de cada topico:
                        - Impedimentos: Quaisquer bloqueios ou desafios que você está enfrentando que possam impedir o progresso do projeto.
                        - Tarefas: As atividades ou tarefas específicas que você planeja realizar.
                        - Retro: O que já foi feito e finalizado.
                        - Comentários: Qualquer feedback adicional ou observações que você queira compartilhar.

                        crie uma recomendação de alteração de codigo para eu so puxar o que voce alterar no codigo.
                    ]],
                mapping = "<leader>cd",
                description = "Ajustar daily",
            },
        },
    },
    keys = {
        { "<leader>cc", ":CopilotChatOpen<CR>",   desc = "Abrir chat do Copilot" },
        { "<leader>cr", ":CopilotChatReview<CR>", desc = "Abrir chat do Copilot para revisar codigo" },
        {
            "<leader>cp",
            function()
                require("CopilotChat").open({
                    window = {
                        layout = "replace",
                    },
                })
            end,
            desc = "Copilot Chat - Replace",
        },
    },
}
