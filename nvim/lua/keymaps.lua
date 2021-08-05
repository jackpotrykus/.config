-- 0. Before anything else...
-- 0.1 Remap <Space> as <leader> key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

-- 0.2 Use <Esc> to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)

-- 1. <leader> shortcuts
-- 1.1 Telesecope shortcuts all beign with <leader>f
vim.api.nvim_set_keymap('n' ,'<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]],                      {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fe', [[<cmd>lua require('telescope.builtin').file_browser()<CR>]],                    {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fo', [[<cmd>lua require('telescope.builtin').vim_options()<CR>]],                     {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fk', [[<cmd>lua require('telescope.builtin').keymaps()<CR>]],                         {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fm', [[<cmd>lua require('telescope.builtin').man_pages()<CR>]],                       {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fb',  [[<cmd>lua require('telescope.builtin').buffers()<CR>]],                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fw',  [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],      {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>ft',  [[<cmd>lua require('telescope.builtin').tags()<CR>]],                           {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fy',  [[<cmd>lua require('telescope.builtin').tags{only_current_buffer = true}<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>f?',  [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],                       {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fs', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],                     {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fj',  [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],                      {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fgc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]],                    {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fgb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]],                   {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fgs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]],                     {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fgp', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]],                   {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fls',  [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],          {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>fld',  [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]],               {noremap = true, silent = true})
vim.api.nvim_set_keymap('n' ,'<leader>flr',  [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]],                {noremap = true, silent = true})

-- 1.2 Toggle NvimTree with <leader>a
vim.api.nvim_set_keymap('n', '<leader>a', ':NvimTreeToggle<CR>', {noremap = true})

-- 1.3 Toggle SymbolsOutline with <leader>so
vim.api.nvim_set_keymap('n', '<leader>so', ':SymbolsOutline<CR>', {noremap = true})

-- 1.4 Toggle LspTrouble with <leader>q
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>LspTroubleToggle<cr>', {silent = true, noremap = true})

-- 1.5 Open a floating terminal (from FTerm) with <leader><space>
vim.api.nvim_set_keymap('n', '<leader><space>', '<CMD>lua require"FTerm".toggle()<CR>',            {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<leader><space>', '<C-\\><C-n><CMD>lua require"FTerm".toggle()<CR>', {noremap = true, silent = true})

-- 1.6 Open markdown preview (from glow.nvim) with <leader>pp
vim.api.nvim_set_keymap('n', '<leader>pp', ':Glow<CR>', {noremap = true, silent = true})

-- 1.7 nvim-dap configuration
vim.api.nvim_set_keymap('n', '<leader>za', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>zz', [[<cmd>lua require'dap'.continue()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>zo', [[<cmd>lua require'dap'.step_over()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>zi', [[<cmd>lua require'dap'.step_into()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>zp', [[<cmd>lua require'dap'.step_out()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>zd', [[<cmd>lua require'dap'.repl.open()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>zx', [[<cmd>lua require'dap'.repl.open()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>zr', [[lua require'dap'.repl.run_last()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>zt', [[lua require'dap-python'.test_method()]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>zs', [[lua require'dap-python'.debug_selection()]], {noremap = true, silent = true})

-- 2. Movement and editing
-- 2.1 Swap lines with <leader>j/k
vim.api.nvim_set_keymap('n', '<leader>j', ':m .+1<CR>==',        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':m .-2<CR>==',        {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>j', ':m \'>+1<CR>gv=gv',   {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>k', ':m \'<-2<CR>gv=gv',   {noremap = true})
-- Inadvisible to have the insert mode mapping on when <space> is <leader>
-- vim.api.nvim_set_keymap('i', '<leader>j', '<Esc>:m .+1<CR>==gi', {noremap = true})
-- vim.api.nvim_set_keymap('i', '<leader>k', '<Esc>:m .-2<CR>==gi', {noremap = true})

-- 2.2 Better j and k
vim.api.nvim_set_keymap('n', 'k', 'v:count == 0 ? "gk" : "k"', {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', 'v:count == 0 ? "gj" : "j"', {noremap = true, expr = true, silent = true})

-- 2.3 'Y' to yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

-- 2.4 <Tab> and <S-Tab> completion
vim.api.nvim_set_keymap('i', '<Tab>',   'v:lua.tab_complete()',   { expr = true})
vim.api.nvim_set_keymap('s', '<Tab>',   'v:lua.tab_complete()',   { expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true})

-- 3. Tab navigation
vim.api.nvim_set_keymap('n', '<C-T>', ':tabnew<CR>',                  {noremap = true})
vim.api.nvim_set_keymap('n', '<C-C>', ':BufferClose<CR>',             {noremap = true})
vim.api.nvim_set_keymap('n', '<C-N>', ':BufferNext<CR>',              {noremap = true})
vim.api.nvim_set_keymap('n', '<C-P>', ':BufferPrevious<CR>',          {noremap = true})
vim.api.nvim_set_keymap('n', '<C-H>', ':BufferMovePrevious<CR>',      {noremap = true})
vim.api.nvim_set_keymap('n', '<C-L>', ':BufferMoveNext<CR>',          {noremap = true})
vim.api.nvim_set_keymap('i', '<C-T>', '<Esc>:tabnew<CR>',             {noremap = true})
vim.api.nvim_set_keymap('i', '<C-C>', '<Esc>:BufferClose<CR>',        {noremap = true})
vim.api.nvim_set_keymap('i', '<C-N>', '<Esc>:BufferNext<CR>',         {noremap = true})
vim.api.nvim_set_keymap('i', '<C-P>', '<Esc>:BufferPrevious<CR>',     {noremap = true})
vim.api.nvim_set_keymap('i', '<C-H>', '<Esc>:BufferMovePrevious<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-L>', '<Esc>:BufferMoveNext<CR>',     {noremap = true})

-- 4. Miscellany
-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == 'a' then
    vim.cmd[[IndentBlanklineDisable]]
    vim.wo.signcolumn = 'no'
    vim.o.mouse       = 'v'
    vim.wo.number     = false
    print('Mouse disabled')
  else
    vim.cmd[[IndentBlanklineEnable]]
    vim.wo.signcolumn = 'yes'
    vim.o.mouse       = 'a'
    vim.wo.number     = true
    print('Mouse enabled')
  end
end

-- ToggleMouse with <F10>
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<CR>', {noremap = true})
