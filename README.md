# .config

jackpotrykus' configuration files

## Installation

Clone this repostiroy into `$HOME/.config`. When starting `nvim`, run `:PackerSync`.

## Notes

|  __File/Dir__   | __Notes__                                                                       |
| --------------- | ------------------------------------------------------------------------------- |
| `nvim`          | Neovim configuration. Requires v0.5 or greater                                  |
| `tmux`          | Minimal config, mostly ripped from other's dotfiles                             |
| `kitty`         | Terminal emulator. Dependencies in `zshrc` and `tmux.conf`                      |
| `neofetch`      | Controls the output of `neofetch`                                               |
| `ranger`        | Adds support for pdf + image preview when run from `kitty`                      |
| `tmux`          | A pretty bare-bones template; contains some dead code to be fixed/removed       |
| `pyright_confs` | Example `pyright` configuraitons. Note these must be placed in each project dir |
| `pycodestyle`   | `pylsp` settings: which errors to ignore, etc.                                  |


## Dependencies

### Main functionality
* [Neovim](https://neovim.io)
* [tmux](https://github.com/tmux/tmux/wiki)
* [kitty](https://sw.kovidgoyal.net/kitty/)
* [ranger](https://github.com/ranger/ranger)
* [neofetch](https://github.com/dylanaraps/neofetch)
* [Tree-sitter](https://tree-sitter.github.io/tree-sitter/)

### Language servers (for Neovim)
Most can be installed with `:LspInstall` inside Neovim. Some notes below.

I can't decide on which python language server is better.
`pyright` is (slightly) faster and (_super_ slightly) more feature-complete, but requires more configuration. Also, (very) occasional strange unexpected behavior.
`pylsp` has never given me any hiccups; that's what I use currently.
* [pyright](https://github.com/microsoft/pyright)
* [pylsp](https://github.com/python-lsp/python-lsp-server)

You'll need these programs for a lua language server. Even if you never write lua code except for your nvim config it's worth installing.
The first, `sumneko`, is a lua language server; the second, `efm-langsever` is a general-purpose language server, which is configured to use `lua-format`, the third, `lua-format`, as a formatter.
If a language server provides formatting utility, you can format files of that type with `:Format`.
* [sumneko](https://github.com/sumneko/lua-language-server)
* [efm-langserver](https://github.com/mattn/efm-langserver)
* [lua-format](https://github.com/Koihik/LuaFormatter)
