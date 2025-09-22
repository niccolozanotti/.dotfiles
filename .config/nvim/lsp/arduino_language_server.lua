return {

    capabilities = {
        textDocument = {
            semanticTokens = vim.NIL,
        },
        workspace = {
            semanticTokens = vim.NIL,
        },
    },

    cmd = {
        "arduino-language-server",
        "-cli-config",
        "/Users/niccolozanotti/Library/Arduino15/arduino-cli.yaml",
        "-fqbn",
        "arduino:avr:uno",
        "-cli",
        "arduino-cli",
        "-clangd",
        "clangd",
    },

    filetypes = { "arduino" },

    root_dir = function(bufnr, on_dir)
        on_dir(vim.fn.expand "%:p:h")
    end,
}
