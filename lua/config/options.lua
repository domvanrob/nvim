vim.loader.enable()

vim.opt.nu = true
vim.opt.relativenumber = true

vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Enable break indent and smart indenting
vim.o.breakindent = true
vim.o.smartindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 500

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

local undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undodir = undodir
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- vim.opt.colorcolumn = "100"

vim.opt.completeopt = "menuone,noselect,fuzzy"
vim.opt.shortmess:append("c")

-- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
-- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
