vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.fypp", "*.pf", "*.pyf" },
    command = "set filetype=fortran",
})
