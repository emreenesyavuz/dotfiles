local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "snowflake" }, -- change to your dialect
        }),
        null_ls.builtins.formatting.sqlfluff.with({
        extra_args = { "--dialect", "snowflake" }, -- change to your dialect
    }),
    },
})
