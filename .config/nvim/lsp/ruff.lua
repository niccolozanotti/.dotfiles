return {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
    capabilities = {
        general = {
            positionEncodings = { "utf-8" }, -- Force UTF-8 encoding
        },
    },
    settings = {
        logLevel = "debug",
        -- format = {
        --     docstring_code_format = false, -- Disable docstring formatting
        -- },
        -- lint = {
        --     select = {
        --         "PL",
        --         "I",
        --         "E",
        --         "W",
        --         "NPY",
        --         "FLY",
        --         "RUF",
        --         "ARG",
        --         "SLF",
        --         "S",
        --         "BLE",
        --         "B",
        --         "A",
        --         "C4",
        --         "EM",
        --         "ICN",
        --         "PIE",
        --         "Q",
        --         "RSE",
        --         "SIM",
        --         "TID",
        --     },
        --     ignore = { "SIM108", "RUF002" },
        -- },
    },
}
