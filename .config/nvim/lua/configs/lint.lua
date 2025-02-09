local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
}

-- If running into problems, avoid using unpack and write the args explicitely.
-- See https://github.com/ProgrammingRainbow/NvChad-2.5/commit/ef0a2e2dac5305fcd8d9e65c9d94273f06c7912c
lint.linters.luacheck.args = {
    "--globals",
    "vim",
    -- unpack(lint.linters.luacheck.args),
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
}

-- Check the table contents
-- :lua print(vim.inspect(require('lint').linters.luacheck.args))

-- Autocommand to check for linting
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})
