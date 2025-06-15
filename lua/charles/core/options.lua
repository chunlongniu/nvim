vim.cmd("let g:netrw_liststyle = 3");

local opt = vim.opt;

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when search
opt.smartcase = true  -- if you include mixed case in your search assumes you want case-sensive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, endo of line or insert model start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- max code length
vim.wo.colorcolumn = "80"

-- new line align using space to instead tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

--forbidden create backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- autocomplete not chose automatically
vim.g.completeopt = "menu,menuone,noselect,noinsert"
vim.o.shortmess = vim.o.shortmess .. "c"

vim.fn.setenv("GEMINI_API_KEY", "AIzaSyAdWgXZeTs-uRc0YycwScKQ2xG1cPOh5nY")
vim.opt.laststatus = 3
vim.g.codeium_enabled = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown", "c", "c++"},
  callback = function()
      vim.g.codeium_enabled = false
  end,
})
