local surround = require("nvim-surround")
-- full configuration info :h nvim-surround.configuration
surround.setup({
    -- Keymaps for different operations
    keymaps = {
        insert = "<C-g>s", -- Insert mode: surround current position
        insert_line = "<C-g>S", -- Insert mode: surround current position with newlines
        normal = "ys", -- Normal mode: surround with motion
        normal_cur = "yss", -- Normal mode: surround current line
        normal_line = "yS", -- Normal mode: surround with motion on new lines
        normal_cur_line = "ySS", -- Normal mode: surround current line on new lines
        visual = "S", -- Visual mode: surround selection
        visual_line = "gS", -- Visual mode: surround selection with new lines
        delete = "ds", -- Delete surrounding pair
        change = "cs", -- Change surrounding pair
        change_line = "cS", -- Change surrounding pair with newlines
    },

    -- You can customize surrounds or keep the defaults
    surrounds = {
        ["m"] = {
            add = { "$", "$" },
            find = function()
                return require("nvim-surround.config").get_selection({ pattern = "$.-($)" })
            end,
            delete = "^($)().-($)()$",
        },
        ["M"] = {
            add = { "$$", "$$" },
            find = function()
                return require("nvim-surround.config").get_selection({ pattern = "%$%$.-(%$%$)" })
            end,
            delete = "^(%$%$)().-(%$%$)()$",
        },
        ["L"] = {
            -- \left and \right enclosing for LaTeX
            add = { "\\left", "\\right" },
            find = function()
                return require("nvim-surround.config").get_selection({ pattern = "\\left.-(\\right)" })
            end,
            delete = "^(\\left)().-(\\right)()",
        },
    },

    -- Custom aliases for surrounding characters
    aliases = {
        ["a"] = ">",
        ["b"] = ")",
        ["B"] = "}",
        ["r"] = "]",
        ["q"] = { '"', "'", "`" },
        ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },

    -- Highlighting options
    highlight = {
        duration = 0, -- 0 disables highlighting, positive values enable it for that duration in ms
    },

    -- Move cursor after surrounding (can be "begin", "end", or nil for no movement)
    move_cursor = "begin",

    -- Function called to indent affected lines
    -- indent_lines = function(start, stop)
    --   -- Custom indentation logic here
    -- end,
})
