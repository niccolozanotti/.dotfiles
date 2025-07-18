-- LSP servers
vim.lsp.enable({
    "lua_ls",
    "pyright",
    "ruff",
    "clangd",
    "cmake",
    "fortls",
    "julials",
})

-- Configure LspAttach autocommand for keymaps and settings
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        --https://docs.astral.sh/ruff/editors/setup/#neovim
        if client.name == "ruff" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
        local bufnr = args.buf

        -- Your existing keymaps (from nvchad.mappings)
        local opts = { buffer = bufnr, silent = true }

        -- Enable completion (replaces cmp-nvim-lsp capabilities)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
        end

        -- Enable inlay hints for Rust
        if client.name == "rust_analyzer" and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        -- Auto-format on save (if server supports it and conform.nvim doesn't handle it)
        if client:supports_method("textDocument/formatting") and client.name ~= "clangd" then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("LspFormatting", { clear = false }),
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})
