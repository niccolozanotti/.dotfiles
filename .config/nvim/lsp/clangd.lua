return {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
    filetypes = { "c", "cpp" },
    root_markers = { ".clangd", "compile_commands.json", "compile_flags.txt", "CMakeLists.txt", ".git" },
    -- Note: formatting will be handled by conform.nvim
    capabilities = {
        textDocument = {
            formatting = false,
            rangeFormatting = false,
        },
    },
}
