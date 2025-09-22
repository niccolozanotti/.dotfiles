-- Options
vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.opt.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"

vim.g.mapleader = " "

-- Native plugin manager (nvim v0.12+)
vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{
		src = "https://github.com/christoomey/vim-tmux-navigator",
		data = {
			cmd = {
				"TmuxNavigateLeft",
				"TmuxNavigateDown",
				"TmuxNavigateUp",
				"TmuxNavigateRight",
				"TmuxNavigatePrevious",
			},
		},
	},
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.bufremove" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
})

-- Plugins configuration
local oil_opts = require("oil-opts")
local surround_opts = require("mini-surround-opts")
local treesitter_opts = require("treesitter-opts")
require("oil").setup(oil_opts)
require("mini.surround").setup(surround_opts)
require("nvim-treesitter").setup(treesitter_opts)
require("mini.pick").setup()
require("mini.bufremove").setup()

-- Lsps (nvim0.11+)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

-- Language servers are installed as nixpkgs
-- See here https://git.sr.ht/~niccolozanotti/nix-darwin/tree/main/item/modules/packages.nix
vim.lsp.enable({
	"lua_ls",
	"bashls",
	"pyright",
	"ruff",
	"clangd",
	"arduino_language_server",
	"cmake",
	"fortls",
	"julials",
	"zls",
	"tinymist",
})

vim.cmd("set completeopt+=menuone,noselect,popup")

-- Coloring, theme
vim.cmd("colorscheme catppuccin")
vim.cmd(":hi statusline guibg=NONE")

-- Mappings
local map = vim.keymap.set

-- auto correct spelling under cursor
map({ 'n', 'v' }, '<leader>c', '1z=')
-- nvim buffer management
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>s', ':e #<CR>')
map('n', '<leader>S', ':sf #<CR>')
map('n', '<leader>v', ':vsplit<CR>')
-- Pickers
map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")
-- Interaction with system clipboard
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
map({ 'n', 'v', 'x' }, '<leader>p', '"+p<CR>')
-- Lsps
map('n', '<leader>lf', vim.lsp.buf.format)
-- Vim-tmux
map('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>', { silent = true })
map('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>', { silent = true })
map('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>', { silent = true })
map('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { silent = true })
map('n', '<C-\\>', '<cmd>TmuxNavigatePrevious<CR>', { silent = true })
