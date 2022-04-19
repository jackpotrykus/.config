require'nvim-tree'.setup {disable_netrw = true, hijack_netrw = true}
-- Toggle NvimTree with <leader>a
vim.api.nvim_set_keymap('n', '<leader>a', ':NvimTreeToggle<CR>', {noremap = true})
