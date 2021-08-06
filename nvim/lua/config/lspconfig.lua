local nvim_lsp = require 'lspconfig'

-- First argument is 'client' technically, should you ever need to do something with that
-- i.e. on_attach(client, bufnr) is a more descriptive function signature
local on_attach = function(_, bufnr)
  local opts = {noremap = true, silent = true}

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'C-x', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'C-z', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'C-k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>i', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',                                opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',                       opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',                    opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  -- Load `ray-x/lsp_signature.nvim`
  require'lsp_signature'.on_attach()
end

-- List your LSP servers here
-- Still haven't decided which python LSP is the best... pyright is fast, but pylsp is more consistent
local servers = {
  'pylsp', -- 'pyright',
  -- 'jedi_language_server',
  'r_language_server', 'clangd', 'ccls', 'gopls', 'texlab', 'bashls', 'vimls', 'ocamllsp'
}

for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end

-- Diagnostic formatting
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- Enable underline, use default values
  underline = true,
  -- Enable virtual text only on Warning or above, override spacing to 2
  virtual_text = {spacing = 2, severity_limit = 'Warning'}
})

-- Defines `:Format` to vim.lsp.buf.formatting()
-- If your LSP supports linting/formatting, just run `:Format` and your document is linted
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

-- Show signature help while waiting
vim.cmd('inoremap <buffer><silent> <C-p> <C-p><Cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.cmd('inoremap <buffer><silent> <C-n> <C-n><Cmd>lua vim.lsp.buf.signature_help()<CR>')

-----------------------------------------------------------------------------------------------
-- Lua LSP configuration                                                                     --
-- This gets a bit more involved, so it's all down here at the end                           --
-- See https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/ for more information --
-----------------------------------------------------------------------------------------------
-- Load folke/lua-dev.nvim 
local luadev = require("lua-dev").setup({
  -- add any options here, or leave empty to use the default settings
  -- lspconfig = {
  --   cmd = {"lua-language-server"}
  -- },
})

local user = vim.fn.expand('$USER')

local sumneko_root_path = ""
if vim.fn.has("mac") == 1 then
  -- WARN: Make sure the below corresponds to your Sumneko LSP installation path
  sumneko_root_path = vim.fn.getenv('HOME') .. '/.local/bin/sumneko_lua'
elseif vim.fn.has("unix") == 1 then
  -- WARN: Make sure the below corresponds to your Sumneko LSP installation path
  -- sumneko_root_path = "/home/" .. user .. "/.config/nvim/lua-language-server"
  -- sumneko_binary = "/home/" .. user .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
else
  print("Unsupported system for sumneko")
end

-- Set up sumneko LSP (for code-completion, diagnostics, etc)
nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_root_path .. '/bin/macOS/lua-language-server', '-E', sumneko_root_path .. '/main.lua'},
  on_attach = on_attach,
  luadev
}

-- Set up efm LSP (for formatting)
nvim_lsp.efm.setup {
  init_options = {documentFormatting = true},
  filetypes = {"lua"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {
        {
          formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb --indent-width=2",
          formatStdin = true
        }
      }
    }
  }
}
