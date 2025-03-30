-- Autocommand to run Fortitude on Fortran file save with auto-fix
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.f90", "*.f95", "*.f03", "*.f08", "*.for", "*.f" },
    callback = function()
        local filename = vim.api.nvim_buf_get_name(0)
        local cmd = { "fortitude", "check", "--fix", filename }

        -- Run Fortitude and capture output
        vim.fn.jobstart(cmd, {
            stdout_buffered = true,
            stderr_buffered = true,
            on_stdout = function(_, data)
                if data and #data > 1 then
                    -- Clear previous diagnostics
                    vim.diagnostic.reset(0)

                    local diagnostics = {}
                    for _, line in ipairs(data) do
                        if line and line ~= "" then
                            -- Parse Fortitude output format:
                            -- filename:line:column:code:message
                            local file, line_nr, col, code, message = line:match("([^:]+):(%d+):(%d+):([%w%d]+):(.+)")

                            if line_nr and col and message then
                                local severity = vim.diagnostic.severity.WARN
                                -- Adjust severity based on rule code prefix
                                if code and code:sub(1, 1) == "E" then
                                    severity = vim.diagnostic.severity.ERROR
                                elseif code and code:sub(1, 1) == "S" then
                                    severity = vim.diagnostic.severity.INFO
                                end

                                table.insert(diagnostics, {
                                    lnum = tonumber(line_nr) - 1,
                                    col = tonumber(col) - 1,
                                    end_lnum = tonumber(line_nr) - 1,
                                    end_col = tonumber(col),
                                    severity = severity,
                                    message = code .. ": " .. message:gsub("^%s*(.-)%s*$", "%1"),
                                    source = "fortitude",
                                })
                            end
                        end
                    end

                    -- Set diagnostics for the current buffer
                    if #diagnostics > 0 then
                        vim.diagnostic.set(0, 0, diagnostics)
                    end
                end
            end,
            on_stderr = function(_, data)
                if data and #data > 1 then
                    local err_msg = table.concat(data, "\n"):gsub("^%s*(.-)%s*$", "%1")
                    if err_msg and err_msg ~= "" then
                        vim.notify("Fortitude error: " .. err_msg, vim.log.levels.ERROR)
                    end
                end
            end,
        })
    end,
})
