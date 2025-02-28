local opt = vim.opt
local api = vim.api

-- Disable compatibility mode
opt.compatible = false

-- UI settings
opt.showmatch = true  -- Show matching brackets
opt.ignorecase = true -- Case-insensitive search
opt.mouse = "a"       -- Enable mouse support
opt.hlsearch = true   -- Highlight search results
opt.incsearch = true  -- Incremental search
vim.wo.linebreak = true
vim.wo.wrap = true
vim.o.list = true

-- Indentation settings
opt.tabstop = 4       -- Number of spaces per tab
opt.softtabstop = 4   -- Number of spaces per tab when editing
opt.expandtab = true  -- Convert tabs to spaces
opt.shiftwidth = 4    -- Indentation amount for auto-indent
opt.autoindent = true -- Enable auto-indent
opt.scrolloff = 5     -- Keep at least 5 lines above/below cursor

-- Color settings
opt.termguicolors = true -- Enable 24-bit RGB colors

-- Command-line completion mode
opt.wildmode = { "longest", "list" }

-- Enable filetype-specific settings
vim.cmd("filetype plugin indent on")
vim.cmd("filetype plugin on")
vim.cmd("syntax on")

-- Performance optimization
opt.ttyfast = true

-- Disable swap file
opt.swapfile = false

-- Key mappings
api.nvim_set_keymap("n", "<C-a>", "<ESC>^", { noremap = true, silent = true })
api.nvim_set_keymap("i", "<C-a>", "<ESC>I", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-e>", "<ESC>$", { noremap = true, silent = true })
api.nvim_set_keymap("i", "<C-e>", "<ESC>A", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-b>", "<Esc>B", { noremap = true, silent = true })
api.nvim_set_keymap("i", "<C-b>", "<Esc>Bi", { noremap = true, silent = true })

-- Smooth cursor movement in wrapped lines
api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })

-- Custom syntax highlighting for TODO-related keywords
vim.cmd [[syntax keyword cTodo TODO ODOT FIXME HACK XXX BUG NOTE]]

