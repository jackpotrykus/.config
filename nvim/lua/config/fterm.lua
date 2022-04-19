require'FTerm'.setup({
    dimensions = {height = 0.8, width = 0.8, x = 0.5, y = 0.5},
    border = 'single' -- or 'double'
})

-- Toggle with <leader><space>
vim.api.nvim_set_keymap('n', '<leader><space>', '<CMD>lua require"FTerm".toggle()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<leader><space>', '<C-\\><C-n><CMD>lua require"FTerm".toggle()<CR>',
                        {noremap = true, silent = true})
