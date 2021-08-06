local dap = require('dap')
local dapui = require('dapui').setup({
  sidebar = {
    open_on_start = true,
    elements = {
      -- You can change the order of elements in the sidebar
      "scopes", "breakpoints", "stacks", "watches"
    },
    width = 40,
    position = "right" -- Can be "left" or "right"
  },
  tray = {
    open_on_start = false,
    elements = {"repl"},
    height = 10,
    position = "bottom" -- Can be "bottom" or "top"
  }
})

require('dap-python').setup('`which python3`')
require('dap-python').test_runner = 'pytest'

-- TODO: Convert to `nvim_buf_set_keymap`
vim.api.nvim_exec('nnoremap <silent> <leader>dn :lua require("dap-python").test_method()<CR>', false)
vim.api.nvim_exec('nnoremap <silent> <leader>df :lua require("dap-python").test_class()<CR>', false)
vim.api.nvim_exec('vnoremap <silent> <leader>ds <ESC>:lua require("dap-python").debug_selection()<CR>', false)

-- dap.adapters.python = {
--   type    = 'executable';
--   command = '`which python3`',
--   os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
--   args    = { '-m', 'debugpy.adapter' };
-- }

-- Keybindings
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
