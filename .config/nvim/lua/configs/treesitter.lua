local options = {
    ensure_installed = {
        -- Notes
        "markdown",
        "markdown_inline",
        -- Shell
        "bash",
        "printf",
        -- Web
        "html",
        "css",
        "javascript",
        "typescript",
        -- Scientific
        "python",
        "c",
        "cpp",
        "fortran",
        "cmake",
        "make",
        -- Programming
        "rust",
        -- Containerization
        "dockerfile",
        -- Config
        "lua",
        "luadoc",
        "json",
        "vim",
        "vimdoc",
        "yaml",
        "toml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
