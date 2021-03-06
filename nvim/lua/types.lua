-- See https://gist.github.com/folke/fe5d28423ea5380929c3f7ce674c41d8
-- and https://www.reddit.com/r/neovim/comments/naig9y/correct_sumneko_lua_lsp_setup_for_initlua_and/
-- put this file somewhere in your nvim config, like: ~/.config/nvim/lua/types.lua
-- DONT require this file anywhere. It's simply there for the lsp server.
-- this code seems weird, but it hints the lsp server to merge the required packages in the vim global variable
vim = require('vim.shared')
vim = require('vim.uri')
vim = require('vim.inspect')

-- let sumneko know where the sources are for the global vim runtime
vim.lsp = require('vim.lsp')
vim.treesitter = require('vim.treesitter')
vim.highlight = require('vim.highlight')
