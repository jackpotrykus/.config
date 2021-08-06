-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- No wrap
vim.o.wrap = false

-- Set timeoutlen
vim.o.timeoutlen = 250

-- Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Do not save when switching buffers
vim.o.hidden = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Set fillchars
vim.o.fillchars = vim.o.fillchars .. 'eob: '

-- Save undo history
vim.cmd [[set undofile]]

-- Case preferences when searching
vim.o.ignorecase = false
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Change preview window location
vim.g.splitbelow = true

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect' -- removed noinsert

-- Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.tokyonight_italic_comments = false
vim.cmd [[colorscheme tokyonight]]
