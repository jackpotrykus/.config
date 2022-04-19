local iron = require('iron')

iron.core.add_repl_definitions {
    clojure = {lein_connect = {command = {'lein', 'repl', ':connect'}}},
    go = {gore = {command = {'gore'}}}
}

iron.core.set_config {preferred = {python = 'ipython', clojure = 'lein'}}

vim.api.nvim_set_keymap('n', '<leader>ss', [[<cmd>IronRepl<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>IronReplHere<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sr', [[<cmd>IronRestart<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sl', [[<cmd>lua require('iron').core.send_line()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader>sv', [[<esc>gv<cmd>lua require('iron').core.visual_send()<CR>]],
                        {noremap = true, silent = true})
