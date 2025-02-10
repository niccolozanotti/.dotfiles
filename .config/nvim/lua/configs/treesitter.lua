local options = {
    ensure_installed = {
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "bash",
        "printf",
        "fortran",
        "python",
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
