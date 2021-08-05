-- -----------------------------------------------------------------------------
-- | jackpotrykus' Neovim configuration (2021-06-01)                           |
-- |---------------------------------------------------------------------------|
-- |                                                                           |
-- | The base of this configuartion comes from the following sensible          |
-- | collection of defaults:                                                   |
-- | https://github.com/mjlbach/defaults.nvim/blob/master/init.lua             |
-- |                                                                           |
-- | Most things are documented. If something isn't... it works just trust me. |
-- -----------------------------------------------------------------------------

-- Install `packer`: `use-package` inspired package mangement
local execute      = vim.api.nvim_command
local install_path = vim.fn.stdpath( 'data' ) .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty( vim.fn.glob( install_path ) ) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)


local use = require'packer'.use
require'packer'.startup(function()
  use 'wbthomason/packer.nvim'                           -- Package manager
  use 'tpope/vim-vinegar'                                -- File browser (netrw) improvements
  use 'tpope/vim-surround'                               -- 'Surround text with' actions
  use 'tpope/vim-fugitive'                               -- The only Git plugin that matters
  use 'tpope/vim-rhubarb'                                -- Expands on `vim-fugitive` to interact with GitHub
  use 'tpope/vim-repeat'                                 -- More exhaustive '.'-repeats
  use 'tpope/vim-sleuth'                                 -- Detects and sets indentation settings from current file
  use 'tpope/vim-dispatch'                               -- Better compilation within (Neo-)vim
  use 'tpope/vim-commentary'                             -- Tim Pope's finest: 'gc' to comment visual regions/lines
  use {'lervag/vimtex',   ft = 'tex'}                    -- The definitive LaTeX suite for (neo)vim
  use {'psf/black',       ft = 'python'}                 -- The uncompromising Python formatter
  use {'jalvesaq/Nvim-R', ft = 'r', branch = 'stable'}   -- RStudio-like R IDE in Neovim
  use {'fatih/vim-go',    ft = 'go'}                     -- Collection of tools for Go development
  use 'metakirby5/codi.vim'                              -- Interactive scratchpad. Try :Codi python
  use 'sindrets/diffview.nvim'                           -- Get a better diff view in a split pane
  use 'kyazdani42/nvim-tree.lua'                         -- File explorer for Neovim
  use 'norcalli/nvim-colorizer.lua'                      -- Show colors over hex symbols
  use 'airblade/vim-rooter'                              -- Change working directory to the project root, when applicable
  use 'numtostr/FTerm.nvim'                              -- Floating terminal! There when you need it
  use 'ludovicchabant/vim-gutentags'                     -- Automatic tags management
  use 'godlygeek/tabular'                                -- Align text with ':Tab', like these comments
  use 'SirVer/ultisnips'                                 -- Still the best snippet managemens
  use 'honza/vim-snippets'                               -- Sensible default snippets for many languages
  use "vhyrro/neorg"                                     -- A modern organizer
  use {
    'nvim-telescope/telescope.nvim',                     -- Snazzy fzf, written in lua
    requires = {
      {'nvim-lua/popup.nvim'},                           -- Required for many plugins
      {'nvim-lua/plenary.nvim'}                          -- Required for many plugins
    }
  }
  use 'nvim-telescope/telescope-media-files.nvim'        -- View media files in `nvim-telescope`
  use 'nvim-treesitter/nvim-treesitter'                  -- Treesitter parsing
  use 'lukas-reineke/indent-blankline.nvim'              -- Show indents
  use 'romgrk/nvim-treesitter-context'                   -- Lightweight alternative to context.vim
  use 'hoob3rt/lualine.nvim'                             -- Lua-fied statusline
  use 'lewis6991/gitsigns.nvim'                          -- Asynchronous git signs
  use 'npxbr/glow.nvim'                                  -- Floating markdown preview inside Neovim with ':Glow'
  use 'mfussenegger/nvim-dap'                            -- Debugging inside Neovim
  use 'rcarriga/nvim-dap-ui'                             -- UI for nvim dap
  use 'mfussenegger/nvim-dap-python'                     -- Python default configs
  use 'neovim/nvim-lspconfig'                            -- Default configurations for built-in LSP client
  use 'kabouzeid/nvim-lspinstall'                        -- Install language servers with `:LspInstall`
  use 'ray-x/lsp_signature.nvim'                         -- Better `textDocument/SignatureHelp` support
  use 'folke/lsp-trouble.nvim'                           -- Auto-updating (and pretty) list of LSP diagnostics
  use 'folke/lsp-colors.nvim'                            -- Make _every_ colorscheme Treesitter compatible
  use 'folke/todo-comments.nvim'                         -- TODO: (and other keywords) are made more visible
  use 'folke/lua-dev.nvim'                               -- Propertly configures Lua LSP for Neovim development
  use {'hkupty/iron.nvim', run = ":UpdateRemotePlugins"} -- Adds send-to-repl support for many programming languages
  use 'folke/which-key.nvim'                             -- Make Neovim self-documenting
  use 'kosayoda/nvim-lightbulb'                          -- Lightbulb when the cursor hovers over a textDocument/codeAction
  use 'simrat39/symbols-outline.nvim'                    -- Use LSP to create symbol outline
  use 'hrsh7th/nvim-compe'                               -- Autocompletion engine
  use 'romgrk/barbar.nvim'                               -- Buffer bar with devicons and clickable buttons
  use 'shaunsingh/solarized.nvim'                        -- Now in Lua
  use 'projekt0n/github-nvim-theme'                      -- It's like GitHub... but in real life
  use 'ayu-theme/ayu-vim'                                -- Ayu suite of colorschemes
  use 'folke/tokyonight.nvim'                            -- Tokyo Night theme adapted from VS Code
  use 'dracula/vim'                                      -- Dracula theme
  use 'shaunsingh/moonlight.nvim'                        -- Moonlight theme adapted from VS Code
  use 'shaunsingh/nord.nvim'                             -- These are starting to look the same ...
  use 'marko-cerovac/material.nvim'                      -- Material suite of themes, written in Lua
  use 'nacro90/numb.nvim'                                -- Peek line 123 with :123
  use 'tweekmonster/startuptime.vim'                     -- Every millisecond counts
  use 'kyazdani42/nvim-web-devicons'                     -- Spruce up the terminal with some nice icons
end)


require'keymaps'
require'config'
require'general'
