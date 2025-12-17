return {
    -- () {} [] '' "" `` <>
    "windwp/nvim-autopairs",
    event = {
        "InsertEnter",
    },
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local autopairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")
        local cond = require("nvim-autopairs.conds")

        autopairs.setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
                java = false,
            },
        })

        -- Add rules for HTML/JSX/TSX tags
        autopairs.add_rules({
            Rule("%", "%", "blade"):with_pair(cond.after_regex("{")):with_move(cond.none()):with_cr(cond.none()),
            Rule("{", "}", "blade"):with_pair(cond.after_regex("%")):with_move(cond.none()):with_cr(cond.none()),
            Rule(">", "")
                :with_pair(cond.before_regex("%a+"))
                :with_move(cond.after_regex("^<"))
                :with_cr(false)
                :with_del(cond.none()),
            Rule("<", "", { "html", "xml", "jsx", "tsx", "blade" })
                :with_pair(cond.after_regex(">$"))
                :with_move(cond.none())
                :with_cr(false)
                :with_del(cond.none()),
        })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
