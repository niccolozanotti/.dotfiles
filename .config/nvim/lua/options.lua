-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/options.lua
require("nvchad.options")

local o = vim.o

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
-- o.cursorlineopt ='both' -- to enable cursorline!

o.number = true
o.relativenumber = true
o.conceallevel = 1 -- for obsidian plugin
