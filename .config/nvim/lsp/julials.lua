return {
    cmd = {
        "julia",
        "--project=~/.julia/environments/nvim-lspconfig",
        "--startup-file=no",
        "--history-file=no",
        "-e",
        "using LanguageServer; runserver()",
    },
    filetypes = { "julia" },
    root_markers = {
        "Project.toml",
        "Manifest.toml",
        "JuliaProject.toml",
        ".git",
    },
}
