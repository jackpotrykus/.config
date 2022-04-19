require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all', -- One of 'all', 'maintained' (parsers with maintainers), or a list of languages
    highlight = {enable = true}, -- enable = false will disable the whole extension
    indent = {enable = true} -- Allow treesitter to set the indents
}

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
