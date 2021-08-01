local dap = require('dap')
local dapui = require('dapui').setup({
  sidebar = {
    open_on_start = true,
    elements = {
      -- You can change the order of elements in the sidebar
      "scopes",
      "breakpoints",
      "stacks",
      "watches"
    },
    width = 40,
    position = "right" -- Can be "left" or "right"
  },
  tray = {
    open_on_start = false,
    elements = {
      "repl"
    },
    height = 10,
    position = "bottom" -- Can be "bottom" or "top"
  },
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
