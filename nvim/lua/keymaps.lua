-----------------------------
-- 0. Before anything else --
-----------------------------
-- Remap <Space> as <leader> key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Use <Esc> to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)

-----------------------------
-- 1. Movement and editing --
-----------------------------

--  Swap lines with <leader>j/k
vim.api.nvim_set_keymap('n', '<leader>j', ':m .+1<CR>==', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':m .-2<CR>==', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>j', ':m \'>+1<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>k', ':m \'<-2<CR>gv=gv', {noremap = true})
-- Inadvisible to have the insert mode mapping on when <space> is <leader>
-- vim.api.nvim_set_keymap('i', '<leader>j', '<Esc>:m .+1<CR>==gi', {noremap = true})
-- vim.api.nvim_set_keymap('i', '<leader>k', '<Esc>:m .-2<CR>==gi', {noremap = true})

-- Better j and k
vim.api.nvim_set_keymap('n', 'k', 'v:count == 0 ? "gk" : "k"', {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', 'v:count == 0 ? "gj" : "j"', {noremap = true, expr = true, silent = true})

-- 'Y' to yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

-- <Tab> and <S-Tab> completion
-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
-- vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
-- vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

-- Tab navigation
vim.api.nvim_set_keymap('n', '<C-T>', ':tabnew<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-C>', ':BufferClose<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-N>', ':BufferNext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-P>', ':BufferPrevious<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-H>', ':BufferMovePrevious<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-L>', ':BufferMoveNext<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-T>', '<Esc>:tabnew<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-C>', '<Esc>:BufferClose<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-N>', '<Esc>:BufferNext<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-P>', '<Esc>:BufferPrevious<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-H>', '<Esc>:BufferMovePrevious<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-L>', '<Esc>:BufferMoveNext<CR>', {noremap = true})

-------------------
-- 2. Miscellany --
-------------------

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
    if vim.o.mouse == 'a' then
        vim.cmd [[IndentBlanklineDisable]]
        vim.wo.signcolumn = 'no'
        vim.o.mouse = 'v'
        vim.wo.number = false
        print('Mouse disabled')
    else
        vim.cmd [[IndentBlanklineEnable]]
        vim.wo.signcolumn = 'yes'
        vim.o.mouse = 'a'
        vim.wo.number = true
        print('Mouse enabled')
    end
end

-- ToggleMouse with <F10>
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<CR>', {noremap = true})
