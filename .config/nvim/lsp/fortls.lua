return {
    cmd = {
        "fortls",
        "--lowercase_intrinsics",
        "--hover_signature",
        "--hover_language=fortran",
        "--use_signature_help",
    },
    filetypes = { "fortran", "f90", "f95", "f03", "f08" },
    root_markers = { ".fortls", ".git" },
}
