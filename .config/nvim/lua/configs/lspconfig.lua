-- Pull some lsp config from the default nvchad lspconfig.lua.
-- See https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L59
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
    "lua_ls",
    "pyright",
    "ruff",
    "clangd",
    "fortls",
}

-- list of servers configured with default config.
local default_servers = {}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach, -- NvChads' default keybindings
        on_init = on_init,
        capabilities = capabilities, -- Better completion support
    })
end

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

lspconfig.pyright.setup({
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { "*" },
            },
        },
    },
})
lspconfig.ruff.setup({
    init_options = {
        settings = {
            logLevel = "debug",
            format = {
                docstring_code_format = false, -- Disable docstring formatting
            },
            lint = {
                select = {
                    -- "D", -- Docstring
                    "PL",
                    "I",
                    "E",
                    "W",
                    "NPY",
                    "FLY",
                    "RUF",
                    "ARG",
                    "SLF",
                    "S",
                    "BLE",
                    "B",
                    "A",
                    "C4",
                    "EM",
                    "ICN",
                    "PIE",
                    "Q",
                    "RSE",
                    "SIM",
                    "TID",
                },
                -- extend_select = { "D417" }, -- docstring rule
                ignore = { "SIM108", "RUF002" },
                -- pydocstyle = {
                --     convention = "numpy",
                -- },
            },
        },
    },
})

lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.fortls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "fortls",
        "--lowercase_intrinsics",
        "--hover_signature",
        "--hover_language=fortran",
        "--use_signature_help",
    },
    filetypes = { "fortran", "f90", "f95", "f03", "f08" },
    root_dir = function(fname)
        local util = require("lspconfig.util")
        -- Look for .fortls file to determine the root
        return util.root_pattern(".fortls")(fname) or util.path.dirname(fname)
    end,
    single_file_support = true,
})
