vim.o.winborder = "rounded"
vim.o.tabstop = 2
vim.o.cursorcolumn = false
vim.o.ignorecase = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.incsearch = true
vim.o.signcolumn = "yes"

local map = vim.keymap.set

vim.g.mapleader = " "

map('n', '<leader>o', ':update<CR>:source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')

map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

require "mason".setup()
require "mini.pick".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "svelte", "typescript", "javascript", "css", "lua", "go" },
	highlight = { enable = true },
})
require "oil".setup()

map('n', '<leader>f', ':Pick files<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>e', ':Oil<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)

vim.lsp.enable({ "svelte-language-server", "lua_ls", "gopls" })

-- snippets
require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

local ls = require("luasnip")
map({ "i" }, "<C-e>", function() ls.expand() end, { silent = true })
map({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
map({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })

-- colors
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
