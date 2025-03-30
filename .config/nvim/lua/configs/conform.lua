local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
    },

    formatters = {
        ["clang-format"] = {
            -- prepend_args = {
            --     "-style={ \
            --       IndentWidth: 2, \
            --       TabWidth: 2, \
            --       UseTab: Never, \
            --       AccessModifierOffset: -2, \
            --       ColumnLimit: 88, \
            --       AlignAfterOpenBracket: Align, \
            --       BraceWrapping: { \
            --           AfterFunction: false, \
            --           AfterControlStatement: false, \
            --           AfterClass: false }, \
            --       NamespaceIndentation: None, \
            --       PointerAlignment: Right, \
            --       SpaceBeforeParens: ControlStatements, \
            --       SpaceAfterCStyleCast: true, \
            --       PackConstructorInitializers: Never }",
            -- },
        },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)

return options
